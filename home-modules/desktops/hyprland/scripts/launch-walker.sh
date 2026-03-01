#!/usr/bin/env bash
#
# launch-walker - Запуск приложения Walker
#
# Описание:
#   Запускает Walker - приложение для запуска приложений и поиска.
#   Перед запуском проверяет и запускает необходимые сервисы:
#   - elephant: провайдер для Walker
#   - walker --gapplication-service: фоновый сервис Walker
#
# Использование:
#   launch-walker [аргументы walker]
#
# Примеры:
#   launch-walker              # Открыть Walker
#   launch-walker -m clipboard # Открыть в режиме буфера обмена
#   launch-walker -m files     # Открыть в режиме файлов
#   launch-walker -m calc      # Открыть калькулятор
#

# Запуск elephant (провайдер для Walker), если не запущен
if ! pgrep -x elephant > /dev/null; then
  setsid uwsm-app -- elephant &
fi

# Запуск Walker как фонового сервиса, если не запущен
if ! pgrep -f "walker --gapplication-service" > /dev/null; then
  setsid uwsm-app -- walker --gapplication-service &
  # Небольшая задержка для инициализации сервиса
  sleep 0.2
fi

# Запуск Walker с переданными аргументами
exec walker --width 644 --maxheight 400 --minheight 200 "$@"
