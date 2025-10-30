{ config, lib, pkgs, ... }:
{
  options = {
    desktops.hyprland.enable = lib.mkEnableOption "Enables Hyprland user configuration";
  };

  config = lib.mkIf config.desktops.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      xwayland.enable = true;
      systemd = {
        enable = true;
        variables = [ "--all" ];
      };
    };

    programs.kitty.enable = true;
  };
}
