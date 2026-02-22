{ config, lib, pkgs, userName, ... }:

{
  options.hardware.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth support";

  config = lib.mkIf config.hardware.bluetooth.enable {
    hardware.bluetooth = {
      enable = lib.mkDefault true;
      powerOnBoot = lib.mkDefault true;
    };

    users.users.${userName}.extraGroups = [ "bluetooth" ];
  };
}
