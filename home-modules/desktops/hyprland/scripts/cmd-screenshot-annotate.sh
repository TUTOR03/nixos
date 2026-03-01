#!/usr/bin/env bash
#
# cmd-screenshot-annotate - Скриншот с аннотацией
#
# Описание:
#   Выделяет область экрана и открывает её в Satty для редактирования.
#   Satty позволяет добавлять стрелки, текст, размытие и т.д.
#
# Использование:
#   cmd-screenshot-annotate
#
# Зависимости:
#   - grim (скриншоты Wayland)
#   - slurp (выделение области)
#   - satty (редактор аннотаций)
#   - notify-send (уведомления)
#
# Конфигурация Satty:
#   ~/.config/satty/config.toml
#

# Получение координат области через slurp
selection=$(slurp 2>/dev/null)

# Проверка что пользователь не отменил выбор
if [[ -z "$selection" ]]; then
  # Пользователь отменил выбор (Esc или клик вне области)
  exit 0
fi

# Захват скриншота выделенной области и открытие в Satty
# Satty сама сохранит файл и скопирует в буфер обмена согласно конфигурации
if grim -g "$selection" - | satty --filename -; then
  # Уведомление (опционально, т.к. Satty может сама уведомлять)
  notify-send "Скриншот с аннотацией" "Отредактирован и сохранён" -i camera-photo
else
  # Если пользователь закрыл Satty без сохранения или произошла ошибка
  exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    notify-send "Ошибка" "Не удалось обработать скриншот" -i dialog-error
  fi
  exit $exit_code
fi
