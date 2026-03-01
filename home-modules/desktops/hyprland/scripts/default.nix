{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = [
      # Application launchers
      (pkgs.writeShellScriptBin "launch-walker" (builtins.readFile ./launch-walker.sh))

      # Interactive menus
      (pkgs.writeShellScriptBin "menu-keybindings" (builtins.readFile ./menu-keybindings.sh))
      (pkgs.writeShellScriptBin "menu-wallpaper" (builtins.readFile ./menu-wallpaper.sh))

      # Screenshot commands
      (pkgs.writeShellScriptBin "cmd-screenshot-full" (builtins.readFile ./cmd-screenshot-full.sh))
      (pkgs.writeShellScriptBin "cmd-screenshot-area" (builtins.readFile ./cmd-screenshot-area.sh))
      (pkgs.writeShellScriptBin "cmd-screenshot-annotate" (builtins.readFile ./cmd-screenshot-annotate.sh))
    ];
  };
}
