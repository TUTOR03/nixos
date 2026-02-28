{ config, lib, pkgs, ... }:
{
  imports = [
    ./caches.nix
    ./desktops
    ./fonts.nix
    ./gaming
    ./hw
    ./network
  ];
}
