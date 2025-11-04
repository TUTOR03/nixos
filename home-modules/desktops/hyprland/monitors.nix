{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = lib.mkDefault [ ",preferred,auto,1" ];

    env = [
      "GDK_SCALE,1"
    ];
  };
}
