{ config, lib, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_STYLE_OVERRIDE,kvantum"
        "SDL_VIDEODRIVER,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "OZONE_PLATFORM,wayland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      ecosystem = {
        no_update_news = true;
      };
    };
  };
}
