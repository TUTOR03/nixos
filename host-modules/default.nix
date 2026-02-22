{ config, lib, pkgs, ... }:
{
  imports = [
    ./desktops
    ./gaming
    ./hardware
    ./network
    ./system-tools
    ./caches.nix
  ];
}
