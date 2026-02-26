{ config, lib, pkgs, ... }:
{
  imports = [
    ./desktops
    ./gaming
    ./hardwares
    ./network
    ./system-tools
    ./caches.nix
  ];
}
