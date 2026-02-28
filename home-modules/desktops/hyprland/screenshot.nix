{ config, lib, pkgs, ... }:

let
  screenshot-full = pkgs.writeShellScriptBin "screenshot-full"
    (builtins.readFile ./scripts/screenshot-full.sh);

  screenshot-area = pkgs.writeShellScriptBin "screenshot-area"
    (builtins.readFile ./scripts/screenshot-area.sh);

  screenshot-annotate = pkgs.writeShellScriptBin "screenshot-annotate"
    (builtins.readFile ./scripts/screenshot-annotate.sh);
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = with pkgs; [
      screenshot-full
      screenshot-area
      screenshot-annotate
    ];

    # Конфиг swappy
    xdg.configFile."swappy/config".source = ./swappy/config;
  };
}
