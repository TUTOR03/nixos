{ config, lib, pkgs, ... }:
{
  imports = [
    ./browsers
    ./code-editors
    ./desktops
    ./shell
    ./tools
    ./git.nix
    ./ssh.nix
  ];
}
