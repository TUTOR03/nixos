#!/usr/bin/env bash

screenshot_dir="$HOME/Pictures/Screenshots"
mkdir -p "$screenshot_dir"
filename="$(date +%Y-%m-%d_%H-%M-%S).png"
filepath="$screenshot_dir/$filename"
grim "$filepath" && wl-copy < "$filepath" && \
  notify-send "Скриншот" "Сохранён: $filename" -i camera-photo
