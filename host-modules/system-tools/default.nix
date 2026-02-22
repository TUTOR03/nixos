{ config, lib, ... }:
{
  imports = [
    ./archive.nix
    ./fonts.nix
    ./monitoring.nix
    ./network.nix
    ./utils.nix
  ];
}
