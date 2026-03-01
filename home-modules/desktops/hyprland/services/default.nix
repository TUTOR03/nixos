{ config, lib, ... }:
{
  imports = [
    ./cursor.nix
    ./screenshot.nix
    ./swww.nix
    ./walker
    ./waybar
  ];
}
