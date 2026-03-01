#!/usr/bin/env bash

screenshot_dir="$HOME/Pictures/Screenshots"
mkdir -p "$screenshot_dir"
filename="$(date +%Y-%m-%d_%H-%M-%S).png"
filepath="$screenshot_dir/$filename"
grim -g "$(slurp)" "$filepath" && wl-copy < "$filepath" && \
  notify-send "Скриншот области" "Сохранён: $filename" -i camera-photo
