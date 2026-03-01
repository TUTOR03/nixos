{ config, lib, pkgs, ... }:

let
  theme = config.desktops.hyprland.themeData;
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    services.mako = {
      enable = true;
      package = pkgs.mako;

      settings = {
        sort = "-time";
        layer = "overlay";
        anchor = "top-right";
        font = "JetBrainsMono Nerd Font 11";
        background-color = theme.mako.background;
        text-color = theme.mako.text;
        width = 350;
        height = 200;
        margin = "16";
        padding = "12";
        border-size = 2;
        border-color = theme.mako.border;
        border-radius = 8;
        icons = true;
        max-icon-size = 48;
        default-timeout = 5000;
        ignore-timeout = false;
        max-visible = 5;
        markup = true;
        actions = true;
        history = true;
        format = "<b>%s</b>\\n%b";

        "urgency=low" = {
          border-color = theme.mako.lowUrgency;
          default-timeout = 3000;
        };

        "urgency=normal" = {
          border-color = theme.mako.normalUrgency;
          default-timeout = 5000;
        };

        "urgency=critical" = {
          border-color = theme.mako.criticalUrgency;
          default-timeout = 0;
        };

        "app-name=spotify" = {
          format = "<b>Now Playing</b>\\n%s\\n%b";
        };
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = [
      "uwsm app -- mako"
    ];
  };
}
