{ config, lib, pkgs, userName, ... }:

{
  options.network.networkmanager.enable = lib.mkEnableOption "Enable NetworkManager";

  config = lib.mkIf config.network.networkmanager.enable {
    networking.networkmanager.enable = true;

    users.users.${userName}.extraGroups = [ "networkmanager" ];
  };
}
