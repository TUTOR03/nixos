{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      layout = lib.mkDefault "dwindle";
      allow_tearing = lib.mkDefault false;
    };
  };
}
