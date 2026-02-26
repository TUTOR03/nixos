{ self, config, lib, pkgs, ... }:

let
  wallpaper-menu = pkgs.writeShellScriptBin "wallpaper-menu"
    (builtins.readFile ./scripts/wallpaper-menu.sh);
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = with pkgs; [
      wallpaper-menu
      swww
    ];

    # Копируем обои из assets в систему
    home.file.".local/share/wallpapers/.keep".text = "";

    # Автозапуск swww при входе
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "swww-daemon"
      ];
    };
  };
}
