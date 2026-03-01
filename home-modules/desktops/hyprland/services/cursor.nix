{ config, lib, pkgs, ... }:

let
  cursor = config.desktops.hyprland.cursor;
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.pointerCursor = {
      name = cursor.name;
      package = pkgs.bibata-cursors;
      size = cursor.size;
      gtk.enable = true;
      x11.enable = true;
    };

    home.sessionVariables = {
      XCURSOR_SIZE = toString cursor.size;
      XCURSOR_THEME = cursor.name;
      HYPRCURSOR_SIZE = toString cursor.size;
      HYPRCURSOR_THEME = cursor.name;
    };
  };
}
