{ config, lib, pkgs, ... }:

let
  launch-walker = pkgs.writeShellScriptBin "launch-walker"
    (builtins.readFile ./launch-walker.sh);
in
{
  config = lib.mkIf config.desktops.hyprland.enable {
    home.packages = with pkgs; [
      launch-walker
    ];
  };
}
