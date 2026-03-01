{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
    };

    xdg.configFile = {
      "waybar/config.jsonc".source = ./config.jsonc;
      "waybar/style.css".source = ./style.css;
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- waybar"
    ];
  };
}
