{ config, lib, pkgs, ... }:

let
  theme = config.desktops.hyprland.themeData;
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = with pkgs; [
      swayosd
      brightnessctl
      playerctl
    ];

    xdg.configFile."swayosd/style.css".text = ''
      window#osd {
        padding: 12px;
        border-radius: 8px;
        background: ${theme.swayosd.background};
        border: 2px solid ${theme.swayosd.barBg};
      }

      window#osd label {
        color: ${theme.swayosd.text};
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }

      window#osd image {
        color: ${theme.swayosd.bar};
      }

      window#osd progressbar {
        min-height: 8px;
        min-width: 200px;
        border-radius: 4px;
        background: ${theme.swayosd.barBg};
      }

      window#osd progressbar trough {
        border-radius: 4px;
        background: ${theme.swayosd.barBg};
      }

      window#osd progressbar progress {
        border-radius: 4px;
        background: ${theme.swayosd.bar};
      }

      window#osd box {
        padding: 8px;
      }
    '';

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- swayosd-server"
    ];
  };
}
