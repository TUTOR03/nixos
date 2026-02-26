{ self, config, lib, pkgs, ... }:

let
  cursorTheme = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    # Курсор через home-manager
    home.pointerCursor = {
      name = cursorTheme.name;
      package = cursorTheme.package;
      size = cursorTheme.size;
      gtk.enable = true;
      x11.enable = true;
    };

    # Дополнительные курсоры из assets (если есть)
    # home.file.".local/share/icons/custom-cursor".source = self + "/assets/cursors";

    # Переменные окружения для курсора
    home.sessionVariables = {
      XCURSOR_SIZE = toString cursorTheme.size;
      XCURSOR_THEME = cursorTheme.name;
      HYPRCURSOR_SIZE = toString cursorTheme.size;
      HYPRCURSOR_THEME = cursorTheme.name;
    };
  };
}
