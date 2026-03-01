{ config, lib, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      monitor = lib.mkDefault [ ",preferred,auto,1" ];
    };
  };
}
