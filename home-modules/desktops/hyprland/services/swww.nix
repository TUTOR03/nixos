{ self, config, lib, pkgs, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = [
      pkgs.swww
    ];

    xdg.dataFile."wallpapers/.keep".text = "";

    wayland.windowManager.hyprland.settings.exec-once = [
      "swww-daemon"
    ];
  };
}
