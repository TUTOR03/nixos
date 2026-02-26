#!/bin/bash

# Скриншот области с аннотациями через swappy

screenshot_dir="$HOME/Pictures/Screenshots"
mkdir -p "$screenshot_dir"

filename="$(date +%Y-%m-%d_%H-%M-%S).png"

grim -g "$(slurp)" - | swappy -f - -o "$screenshot_dir/$filename"
