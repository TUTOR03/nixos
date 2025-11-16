{ config, lib, pkgs, ... }:

{
  options.gaming.lutris.enable = lib.mkEnableOption "Enable Lutris";

  config = lib.mkIf config.gaming.lutris.enable {
    environment.systemPackages = with pkgs; [
      lutris
      wine
      winetricks
    ];
  };
}
