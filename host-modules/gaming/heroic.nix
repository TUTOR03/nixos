{ config, lib, pkgs, ... }:

{
  options.gaming.heroic.enable = lib.mkEnableOption "Enable Heroic launcher";

  config = lib.mkIf config.gaming.heroic.enable {
    environment.systemPackages = with pkgs; [
      heroic
    ];
  };
}
