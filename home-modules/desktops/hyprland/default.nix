{ config, lib, pkgs, ... }:
{
  options = {
    desktops.hyprland.enable = lib.mkEnableOption "Enables Hyprland user configuration";
  };

  config = lib.mkIf config.desktops.hyprland.enable {

    imports = [
      "./binds.nix"
      "./env.nix"
      "./general.nix"
      "./inputs.nix"
      "./looknfeel.nix"
      "./monitors.nix"
      "./windows.nix"
      "./workspaces.nix"
    ];

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
  };
}
