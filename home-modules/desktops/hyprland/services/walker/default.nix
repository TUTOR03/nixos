{ config, lib, pkgs, ... }:

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

    xdg.configFile = {
      "walker/config.toml".source = ./config.toml;
      "walker/themes/${themeName}/style.css".source = ./style.css;
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm-app -- walker --gapplication-service"
    ];
  };
}
