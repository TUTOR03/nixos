{ config, lib, pkgs, self, ... }:

let
  themeName = config.desktops.hyprland.theme;
  theme = import ./themes/${themeName}/default.nix;
in
{
  options.desktops.hyprland = {
    enable = lib.mkEnableOption "Конфигурация Hyprland";

    theme = lib.mkOption {
      type = lib.types.str;
      default = "gruvbox";
    };

    themeData = lib.mkOption {
      type = lib.types.attrs;
      default = theme;
      internal = true;
    };

    cursor = {
      name = lib.mkOption {
        type = lib.types.str;
        example = "Bibata-Modern-Classic";
        description = "Имя темы курсора";
      };

      size = lib.mkOption {
        type = lib.types.int;
        example = 24;
        description = "Размер курсора в пикселях";
      };
    };

    timeouts = {
      lock = lib.mkOption {
        type = lib.types.int;
        default = 300;
        description = "Секунды до блокировки экрана";
      };

      dpms = lib.mkOption {
        type = lib.types.int;
        default = 600;
        description = "Секунды до выключения экрана";
      };

      suspend = lib.mkOption {
        type = lib.types.nullOr lib.types.int;
        default = null;
        description = "Секунды до сна (null = отключено)";
      };
    };
  };

  imports = [
    ./config
    ./scripts
    ./services
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
    };

    xdg.configFile = {
      "waybar/theme.css".source = ./themes/${themeName}/theme.css;
      "walker/themes/${themeName}/theme.css".source = ./themes/${themeName}/theme.css;
    };
  };
}
