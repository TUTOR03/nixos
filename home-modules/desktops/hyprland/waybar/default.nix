{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
    };

    home.file = {
      ".config/waybar/config.jsonc".source = ./config.jsonc;
      ".config/waybar/style.css".source = ./style.css;
    };
  };
}
