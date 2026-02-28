{ config, lib, ... }:
{
  imports = [
    ./bash.nix
    ./ghostty.nix
    ./htop.nix
    ./yazi.nix
  ];
}
