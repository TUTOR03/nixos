#!/usr/bin/env bash
#
# menu-wallpaper - Меню выбора обоев
#
# Описание:
#   Показывает интерактивное меню для выбора обоев из директории
#   и устанавливает выбранные обои через swww.
#
# Использование:
#   menu-wallpaper
#
# Зависимости:
#   - swww (демон обоев)
#   - walker (для dmenu режима)
#   - find (поиск файлов)
#   - notify-send (уведомления)
#
# Директория обоев:
#   ~/.local/share/wallpapers
#
# Поддерживаемые форматы:
#   png, jpg, jpeg, webp
#

# Директория с обоями
wallpaper_dir="$HOME/.local/share/wallpapers"

# Проверка существования директории
if [[ ! -d "$wallpaper_dir" ]]; then
  notify-send "Обои" "Папка с обоями не найдена: $wallpaper_dir" -i dialog-error
  exit 1
fi

# Поиск всех изображений в директории
# Используем массив для хранения путей к файлам
mapfile -t wallpapers < <(find "$wallpaper_dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" \) 2>/dev/null)

# Проверка наличия обоев
if [[ ${#wallpapers[@]} -eq 0 ]]; then
  notify-send "Обои" "Обои не найдены в $wallpaper_dir" -i dialog-error
  exit 1
fi

# Создаём список для меню: "basename | относительный путь"
# Это позволяет различать файлы с одинаковыми именами в разных папках
menu_items=()
declare -A path_map

for wallpaper in "${wallpapers[@]}"; do
  basename=$(basename "$wallpaper")
  relative="${wallpaper#$wallpaper_dir/}"

  # Если файл в корне директории, показываем только имя
  # Если в подпапке, показываем "имя (папка/путь)"
  if [[ "$relative" == "$basename" ]]; then
    display="$basename"
  else
    parent_dir=$(dirname "$relative")
    display="$basename ($parent_dir)"
  fi

  menu_items+=("$display")
  path_map["$display"]="$wallpaper"
done

# Сортировка списка
IFS=$'\n' sorted_items=($(sort <<<"${menu_items[*]}")); unset IFS

# Показываем меню через Walker
selected=$(printf '%s\n' "${sorted_items[@]}" | walker --dmenu -p 'Обои' --width 500 --height 400)

# Если ничего не выбрано - выходим
if [[ -z "$selected" ]]; then
  exit 0
fi

# Получаем полный путь к выбранному файлу
wallpaper_path="${path_map[$selected]}"

# Устанавливаем обои через swww
if [[ -f "$wallpaper_path" ]]; then
  swww img "$wallpaper_path" --transition-type fade --transition-duration 1 && \
    notify-send "Обои" "Установлен: $selected" -i preferences-desktop-wallpaper
else
  notify-send "Ошибка" "Файл не найден: $wallpaper_path" -i dialog-error
  exit 1
fi
