#!/usr/bin/env bash
#
# cmd-screenshot-area - Скриншот выделенной области
#
# Описание:
#   Позволяет выделить область экрана для скриншота с помощью slurp.
#   Сохраняет в ~/Pictures/Screenshots и копирует в буфер обмена.
#
# Использование:
#   cmd-screenshot-area
#
# Зависимости:
#   - grim (скриншоты Wayland)
#   - slurp (выделение области)
#   - wl-copy (буфер обмена Wayland)
#   - notify-send (уведомления)
#

# Определение директории для скриншотов
screenshot_dir="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"

# Создание директории если не существует
mkdir -p "$screenshot_dir" || {
  notify-send "Ошибка" "Не удалось создать директорию: $screenshot_dir" -i dialog-error
  exit 1
}

# Генерация имени файла с временной меткой
filename="$(date +%Y-%m-%d_%H-%M-%S).png"
filepath="$screenshot_dir/$filename"

# Получение координат области через slurp
selection=$(slurp 2>/dev/null)

# Проверка что пользователь не отменил выбор
if [[ -z "$selection" ]]; then
  # Пользователь отменил выбор (Esc или клик вне области)
  exit 0
fi

# Захват скриншота выделенной области
if grim -g "$selection" "$filepath"; then
  # Копирование в буфер обмена
  wl-copy < "$filepath"

  # Уведомление об успехе
  notify-send "Скриншот области" "Сохранён: $filename\nСкопирован в буфер обмена" -i camera-photo
else
  # Уведомление об ошибке
  notify-send "Ошибка" "Не удалось сделать скриншот" -i dialog-error
  rm -f "$filepath"
  exit 1
fi
