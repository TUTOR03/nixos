{ config, lib, ... }:
{
  imports = [
    ./chromium.nix
    ./firefox.nix
  ];
}
