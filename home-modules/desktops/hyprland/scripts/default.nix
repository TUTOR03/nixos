{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "launch-walker" (builtins.readFile ./launch-walker.sh))
      (pkgs.writeShellScriptBin "keybindings-menu" (builtins.readFile ./keybindings-menu.sh))
      (pkgs.writeShellScriptBin "screenshot-full" (builtins.readFile ./screenshot-full.sh))
      (pkgs.writeShellScriptBin "screenshot-area" (builtins.readFile ./screenshot-area.sh))
      (pkgs.writeShellScriptBin "screenshot-annotate" (builtins.readFile ./screenshot-annotate.sh))
      (pkgs.writeShellScriptBin "wallpaper-menu" (builtins.readFile ./wallpaper-menu.sh))
    ];
  };
}
