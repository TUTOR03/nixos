#!/bin/bash

# Меню выбора обоев через walker

wallpaper_dir="$HOME/.local/share/wallpapers"

if [[ ! -d "$wallpaper_dir" ]]; then
  notify-send "Обои" "Папка с обоями не найдена: $wallpaper_dir" -i dialog-error
  exit 1
fi

# Получаем список обоев
wallpapers=$(find "$wallpaper_dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" \) -exec basename {} \; | sort -u)

if [[ -z "$wallpapers" ]]; then
  notify-send "Обои" "Обои не найдены в $wallpaper_dir" -i dialog-error
  exit 1
fi

# Показываем меню через walker
selected=$(echo "$wallpapers" | walker --dmenu -p 'Обои' --width 500 --height 400)

if [[ -n "$selected" ]]; then
  # Находим полный путь к файлу
  wallpaper_path=$(find "$wallpaper_dir" -name "$selected" -type f | head -1)

  if [[ -f "$wallpaper_path" ]]; then
    swww img "$wallpaper_path" --transition-type fade --transition-duration 1
    notify-send "Обои" "Установлен: $selected" -i preferences-desktop-wallpaper
  fi
fi
