{ config, lib, pkgs, self, ... }:

let
  themeName = config.desktops.hyprland.theme;
  themePath = self + "/themes/${themeName}";
  theme = import (themePath + "/default.nix");
in
{
  options.desktops.hyprland = {
    enable = lib.mkEnableOption "Конфигурация Hyprland";
    theme = lib.mkOption {
      type = lib.types.str;
      default = "gruvbox";
      description = "Название темы из папки themes/";
    };
  };

  imports = [
    ./binds.nix
    ./cursor.nix
    ./env.nix
    ./general.nix
    ./inputs.nix
    ./looknfeel.nix
    ./monitors.nix
    ./screenshot.nix
    ./wallpaper.nix
    ./windows.nix
    ./workspaces.nix
    ./waybar
    ./walker
    ./scripts
  ];

  config = lib.mkIf config.desktops.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      xwayland.enable = true;
      systemd = {
        enable = false;
        variables = [ "--all" ];
      };

      settings = {
        exec-once = [
          "uwsm app -- waybar"
          "uwsm-app -- elephant"
          "uwsm-app -- walker --gapplication-service"
        ];
      };
    };

    # Файлы тем для приложений
    home.file = {
      ".config/waybar/theme.css".source = themePath + "/waybar.css";
      ".config/walker/themes/${themeName}/style.css".source = themePath + "/walker.css";
    };
  };
}
