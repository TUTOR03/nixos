{ config, lib, pkgs, userName, ... }:

{
  options.hw.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth support";

  config = lib.mkIf config.hw.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    users.users.${userName}.extraGroups = [ "bluetooth" ];
  };
}
