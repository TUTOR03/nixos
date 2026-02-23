#!/bin/bash

# Отображает шорткаты Hyprland через walker в режиме dmenu

declare -A KEYCODE_SYM_MAP

build_keymap_cache() {
  local keymap
  keymap="$(xkbcli compile-keymap 2>/dev/null)" || return 1

  while IFS=, read -r code sym; do
    [[ -z $code || -z $sym ]] && continue
    KEYCODE_SYM_MAP["$code"]="$sym"
  done < <(
    awk '
      BEGIN { sec = "" }
      /xkb_keycodes/ { sec = "codes"; next }
      /xkb_symbols/  { sec = "syms";  next }
      sec == "codes" {
        if (match($0, /<([A-Za-z0-9_]+)>\s*=\s*([0-9]+)\s*;/, m)) code_by_name[m[1]] = m[2]
      }
      sec == "syms" {
        if (match($0, /key\s*<([A-Za-z0-9_]+)>\s*\{\s*\[\s*([^, \]]+)/, m)) sym_by_name[m[1]] = m[2]
      }
      END {
        for (k in code_by_name) {
          c = code_by_name[k]
          s = sym_by_name[k]
          if (c != "" && s != "" && s != "NoSymbol") print c "," s
        }
      }
    ' <<<"$keymap"
  )
}

lookup_keycode_cached() {
  printf '%s\n' "${KEYCODE_SYM_MAP[$1]}"
}

parse_keycodes() {
  while IFS= read -r line; do
    if [[ $line =~ code:([0-9]+) ]]; then
      code="${BASH_REMATCH[1]}"
      symbol=$(lookup_keycode_cached "$code")
      echo "${line/code:${code}/$symbol}"
    elif [[ $line =~ mouse:([0-9]+) ]]; then
      code="${BASH_REMATCH[1]}"
      case "$code" in
        272) symbol="LMB" ;;
        273) symbol="RMB" ;;
        274) symbol="MMB" ;;
        *)   symbol="mouse:${code}" ;;
      esac
      echo "${line/mouse:${code}/$symbol}"
    else
      echo "$line"
    fi
  done
}

dynamic_bindings() {
  hyprctl -j binds 2>/dev/null |
    jq -r '.[] | select(.description != "") | {modmask, key, keycode, description} | "\(.modmask),\(.key)@\(.keycode),\(.description)"' 2>/dev/null |
    sed -r \
      -e 's/@0//' \
      -e 's/,@/,code:/' \
      -e 's/^0,/,/' \
      -e 's/^1,/SHIFT,/' \
      -e 's/^4,/CTRL,/' \
      -e 's/^5,/SHIFT CTRL,/' \
      -e 's/^8,/ALT,/' \
      -e 's/^9,/SHIFT ALT,/' \
      -e 's/^12,/CTRL ALT,/' \
      -e 's/^13,/SHIFT CTRL ALT,/' \
      -e 's/^64,/SUPER,/' \
      -e 's/^65,/SUPER SHIFT,/' \
      -e 's/^68,/SUPER CTRL,/' \
      -e 's/^69,/SUPER SHIFT CTRL,/' \
      -e 's/^72,/SUPER ALT,/' \
      -e 's/^73,/SUPER SHIFT ALT,/' \
      -e 's/^76,/SUPER CTRL ALT,/' \
      -e 's/^77,/SUPER SHIFT CTRL ALT,/'
}

parse_bindings() {
  awk -F, '
{
    key_combo = $1 " + " $2;
    gsub(/^[ \t]*\+?[ \t]*/, "", key_combo);
    gsub(/[ \t]+$/, "", key_combo);
    gsub(/[ \t]+/, " ", key_combo);

    action = $3;

    if (action != "") {
        printf "%-30s → %s\n", key_combo, action;
    }
}'
}

prioritize_entries() {
  awk '
  {
    line = $0
    prio = 50
    if (match(line, /Терминал/)) prio = 0
    if (match(line, /Браузер/)) prio = 1
    if (match(line, /Запуск приложений/)) prio = 2
    if (match(line, /Закрыть окно/)) prio = 3
    if (match(line, /рабочий стол/)) prio = 4
    if (match(line, /Переместить окно/)) prio = 5
    if (match(line, /фокус/)) prio = 6
    if (match(line, /Расширить|Сузить/)) prio = 7

    printf "%d\t%s\n", prio, line
  }' |
  sort -k1,1n -k2,2 |
  cut -f2-
}

output_keybindings() {
  build_keymap_cache
  dynamic_bindings | sort -u | parse_keycodes | parse_bindings | prioritize_entries
}

if [[ $1 == "--print" || $1 == "-p" ]]; then
  output_keybindings
else
  monitor_height=$(hyprctl monitors -j 2>/dev/null | jq -r '.[] | select(.focused == true) | .height' 2>/dev/null)
  menu_height=$((monitor_height * 40 / 100))

  output_keybindings |
    walker --dmenu -p 'Шорткаты' --width 700 --height "${menu_height:-400}"
fi
