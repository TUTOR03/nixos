{ config, lib, ... }:
{
  imports = [
    ./bash.nix
    ./btop.nix
    ./ghostty.nix
    ./htop.nix
    ./network-tools.nix
    ./yazi.nix
  ];
}
