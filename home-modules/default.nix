{ config, lib, pkgs, ... }:
{
  imports = [
    ./cli
    ./desktops
    ./dev
    ./gui
  ];
}
