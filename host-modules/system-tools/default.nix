{ config, lib, ... }:
{
  imports = [
    ./archive.nix
    ./monitoring.nix
    ./network.nix
    ./utils.nix
  ];
}
