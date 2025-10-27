{ config, lib, pkgs, ... }:
{
  options = {
    desktops.kde.enable = lib.mkEnableOption "Enables KDE Plasma desktop environment";
  };

  config = lib.mkIf config.desktops.kde.enable {
    services = {
      xserver.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
      desktopManager.plasma6.enable = true;

      udisks2.enable = true;
      devmon.enable = true;
      gvfs.enable = true;
    };

    environment.plasma6.excludePackages = lib.mkDefault
      (with pkgs.kdePackages; [
        elisa
        krdp
        discover
        kate
        okular
        khelpcenter
        plasma-browser-integration
        kwalletmanager
        akonadi
        kmail
        kaddressbook
        korganizer
        kontact
        oxygen
        plasma-welcome
        plasma-vault
      ]);

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
      ];
    };
  };
}
