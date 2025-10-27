{ config, lib, pkgs, ... }:

{
  options = {
    system-tools.archive = {
      enable = lib.mkEnableOption "Archive tools";
    };
  };

  config = lib.mkIf config.system-tools.archive.enable {
    environment.systemPackages = with pkgs; [
      gzip
      xz
      zip
    ];
  };
}
