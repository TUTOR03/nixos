{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
    };

    home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
    home.file.".config/waybar/style.css".source = ./style.css;
    home.file.".config/waybar/theme.css".source = ./theme.css;
  };
}
