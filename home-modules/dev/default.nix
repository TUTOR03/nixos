{ config, lib, ... }:
{
  imports = [
    ./git.nix
    ./ssh.nix
  ];
}
