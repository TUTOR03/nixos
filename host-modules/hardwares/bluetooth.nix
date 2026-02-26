{ config, lib, pkgs, userName, ... }:

{
  options.hardwares.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth support";

  config = lib.mkIf config.hardwares.bluetooth.enable {
    hardware.bluetooth = {
      enable = lib.mkDefault true;
      powerOnBoot = lib.mkDefault true;
    };

    users.users.${userName}.extraGroups = [ "bluetooth" ];
  };
}
