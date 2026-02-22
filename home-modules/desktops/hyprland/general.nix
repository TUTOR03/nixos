{ config, lib, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      general = {
        layout = lib.mkDefault "dwindle";
        allow_tearing = lib.mkDefault false;
      };
    };
  };
}
