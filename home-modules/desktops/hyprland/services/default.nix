{ config, lib, ... }:
{
  imports = [
    ./cursor.nix
    ./gtk.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./mako.nix
    ./screenshot.nix
    ./swayosd.nix
    ./swww.nix
    ./walker
    ./waybar
  ];
}
