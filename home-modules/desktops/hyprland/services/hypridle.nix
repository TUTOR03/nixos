{ config, lib, pkgs, ... }:

let
  timeouts = config.desktops.hyprland.timeouts;
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    services.hypridle = {
      enable = true;
      package = pkgs.hypridle;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = timeouts.lock;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = timeouts.dpms;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ] ++ lib.optionals (timeouts.suspend != null) [
          {
            timeout = timeouts.suspend;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
