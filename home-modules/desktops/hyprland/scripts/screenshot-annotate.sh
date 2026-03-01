#!/usr/bin/env bash

screenshot_dir="$HOME/Pictures/Screenshots"
mkdir -p "$screenshot_dir"
filename="$(date +%Y-%m-%d_%H-%M-%S).png"
grim -g "$(slurp)" - | swappy -f - -o "$screenshot_dir/$filename"
