{ config, lib, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      env = [
        # GTK: предпочитать Wayland, fallback на X11
        "GDK_BACKEND,wayland,x11,*"

        # Qt: использовать Wayland, fallback на XCB
        "QT_QPA_PLATFORM,wayland;xcb"

        # SDL: рендерить через Wayland (игры, мультимедиа)
        "SDL_VIDEODRIVER,wayland"

        # Firefox: включить Wayland нативно
        "MOZ_ENABLE_WAYLAND,1"

        # Electron: подсказка использовать Wayland (VSCode, Discord и т.п.)
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"

        # Chromium-based: принудительно использовать Wayland
        "OZONE_PLATFORM,wayland"

        # XDG: объявить сессию как Wayland
        "XDG_SESSION_TYPE,wayland"

        # XDG: идентификатор рабочего стола для xdg-desktop-portal
        "XDG_CURRENT_DESKTOP,Hyprland"

        # XDG: идентификатор сессии для display managers
        "XDG_SESSION_DESKTOP,Hyprland"

        # GTK: отключить автоскейлинг
        "GDK_SCALE,1"
      ];

      xwayland = {
        # XWayland: не масштабировать X11 приложения
        force_zero_scaling = true;
      };

      ecosystem = {
        # Hyprland ecosystem: отключить уведомления об обновлениях
        no_update_news = true;
      };
    };
  };
}
