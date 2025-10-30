{ config, lib, pkgs, userName, ... }:
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

    # services = {
    #   displayManager = {
    #     enable = true;
    #     sddm = {
    #       enable = true;
    #       wayland.enable = true;
    #     };
    #     defaultSession = "hyprland-uwsm";
    #     autoLogin = {
    #       enable = true;
    #       user = userName;
    #     };
    #   };
    # };

    services.greetd.enable = true;
    services.greetd.settings.default_session = {
      command = "${pkgs.uwsm}/bin/uwsm start hyprland-uwsm.desktop";
      user = userName;
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
