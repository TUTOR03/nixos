{ config, lib, pkgs, ... }:

{
  options = {
    system-tools.utils = {
      enable = lib.mkEnableOption "Other utils";
    };
  };

  config = lib.mkIf config.system-tools.utils.enable {
    environment.systemPackages = with pkgs; [
      lm_sensors
      hwinfo
      pciutils
      usbutils
    ];
  };
}
