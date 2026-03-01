#!/usr/bin/env bash
#
# cmd-screenshot-full - Скриншот всего экрана
#
# Описание:
#   Делает скриншот всего экрана и сохраняет в ~/Pictures/Screenshots.
#   Также копирует скриншот в буфер обмена.
#
# Использование:
#   cmd-screenshot-full
#
# Зависимости:
#   - grim (скриншоты Wayland)
#   - wl-copy (буфер обмена Wayland)
#   - notify-send (уведомления)
#

# Определение директории для скриншотов
# Приоритет: XDG_PICTURES_DIR, затем ~/Pictures/Screenshots
screenshot_dir="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"

# Создание директории если не существует
mkdir -p "$screenshot_dir" || {
  notify-send "Ошибка" "Не удалось создать директорию: $screenshot_dir" -i dialog-error
  exit 1
}

# Генерация имени файла с временной меткой
filename="$(date +%Y-%m-%d_%H-%M-%S).png"
filepath="$screenshot_dir/$filename"

# Захват скриншота всего экрана
if grim "$filepath"; then
  # Копирование в буфер обмена
  wl-copy < "$filepath"

  # Уведомление об успехе
  notify-send "Скриншот" "Сохранён: $filename\nСкопирован в буфер обмена" -i camera-photo
else
  # Уведомление об ошибке
  notify-send "Ошибка" "Не удалось сделать скриншот" -i dialog-error
  rm -f "$filepath"
  exit 1
fi
