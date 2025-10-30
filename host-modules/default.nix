{ config, lib, pkgs, ... }:
{
  imports = [
    ./desktops
    ./gaming
    ./system-tools
    ./caches.nix
  ];
}
