{ config, lib, pkgs, ... }:

let
  theme = config.desktops.hyprland.themeData;
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = with pkgs; [
      grim
      slurp
      satty
    ];

    xdg.configFile."satty/config.toml".text = ''
      [general]
      fullscreen = false
      early-exit = true
      initial-tool = "brush"
      copy-command = "wl-copy"
      annotation-size-factor = 1.5
      save-after-copy = true
      default-save-directory = "$HOME/Pictures/Screenshots"
      output-filename = "$HOME/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"

      [brush]
      color = "${theme.satty.brush}"
      size = 3

      [text]
      color = "${theme.satty.text}"
      size = 16
      font-family = "JetBrainsMono Nerd Font"

      [shape]
      color = "${theme.satty.shape}"
      size = 3

      [arrow]
      color = "${theme.satty.arrow}"
      size = 3

      [blur]
      size = 10

      [highlight]
      color = "${theme.satty.highlight}40"
    '';
  };
}
