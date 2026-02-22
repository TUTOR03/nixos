{ config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./multimedia.nix
    ./printing.nix
  ];
}
