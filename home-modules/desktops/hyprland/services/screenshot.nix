{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    xdg.configFile."swappy/config".text = ''
      [Default]
      save_dir=$HOME/Pictures/Screenshots
      save_filename_format=%Y-%m-%d_%H-%M-%S.png
      show_panel=true
      line_size=5
      text_size=20
      text_font=JetBrainsMono Nerd Font
      paint_mode=brush
      early_exit=true
    '';
  };
}
