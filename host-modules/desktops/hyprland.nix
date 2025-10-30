{ config, lib, pkgs, ... }:
{
  options = {
    desktops.hyprland.enable = lib.mkEnableOption "Enables Hyprland desktop environment with UWSM";
  };

  config = lib.mkIf config.desktops.hyprland.enable {
    caches.hyprland.enable = true;

    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      withUWSM = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
