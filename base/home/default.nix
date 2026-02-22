{ config, lib, userName, stateVersion, pkgs, ... }:

{
  imports = [
    ./xdg.nix
  ];

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = lib.mkDefault true;
}
