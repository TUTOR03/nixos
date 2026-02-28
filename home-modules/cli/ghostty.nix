{ config, lib, pkgs, ... }:

{
  options.cli.ghostty.enable = lib.mkEnableOption "Ghostty terminal emulator";

  config = lib.mkIf config.cli.ghostty.enable {
    home.packages = [ pkgs.ghostty ];

    xdg.configFile."ghostty/config".text = ''
      # Theme
      theme = GruvboxDark

      # Cursor
      cursor-style = bar
      cursor-style-blink = true

      # Font
      font-family = JetBrains Mono
      font-size = 14

      # Window
      window-padding-x = 10
      window-padding-y = 10
      window-theme = auto

      # Performance
      gpu-renderer = auto
      vsync = true
    '';
  };
}
