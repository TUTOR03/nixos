{ config, lib, pkgs, ... }:
{
  imports = [
    ./heroic.nix
    ./lutris.nix
    ./steam.nix
  ];
}
