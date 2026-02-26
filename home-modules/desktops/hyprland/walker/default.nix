{ config, lib, pkgs, self, ... }:

let
  themeName = config.desktops.hyprland.theme;
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    programs.walker = {
      enable = true;
      runAsService = true;
      config = { };
    };

    home.file = {
      ".config/walker/config.toml".source = ./config.toml;
    };
  };
}
