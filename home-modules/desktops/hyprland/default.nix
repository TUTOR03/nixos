{ config, lib, pkgs, ... }:

{
  options = {
    desktops.hyprland.enable = lib.mkEnableOption "Конфигурация Hyprland";
  };

  imports = [
    ./binds.nix
    ./env.nix
    ./general.nix
    ./inputs.nix
    ./looknfeel.nix
    ./monitors.nix
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
  };
}
