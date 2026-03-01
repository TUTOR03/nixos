{ config, lib, pkgs, ... }:

let
  theme = config.desktops.hyprland.themeData;
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    programs.hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
    };

    xdg.configFile."hypr/hyprlock.conf".text = ''
      $accent = ${theme.hyprlock.accent}
      $background = ${theme.hyprlock.background}
      $inputBg = ${theme.hyprlock.inputBg}
      $textColor = ${theme.hyprlock.textColor}
      $subtextColor = ${theme.hyprlock.subtextColor}
      $font = JetBrainsMono Nerd Font

      general {
        disable_loading_bar = true
        hide_cursor = true
        grace = 0
        no_fade_in = false
        no_fade_out = false
        ignore_empty_input = true
      }

      background {
        monitor =
        path = screenshot
        blur_passes = 3
        blur_size = 8
        color = $background
      }

      input-field {
        monitor =
        size = 250, 50
        outline_thickness = 2
        dots_size = 0.2
        dots_spacing = 0.15
        dots_center = true
        outer_color = $accent
        inner_color = $inputBg
        font_color = $textColor
        fade_on_empty = false
        placeholder_text = <i>Введите пароль...</i>
        hide_input = false
        position = 0, -50
        halign = center
        valign = center
      }

      label {
        monitor =
        text = cmd[update:1000] echo "$(date +'%H:%M')"
        color = $textColor
        font_size = 96
        font_family = $font
        position = 0, 100
        halign = center
        valign = center
      }

      label {
        monitor =
        text = cmd[update:60000] echo "$(date +'%A, %d %B')"
        color = $subtextColor
        font_size = 24
        font_family = $font
        position = 0, 30
        halign = center
        valign = center
      }
    '';
  };
}
