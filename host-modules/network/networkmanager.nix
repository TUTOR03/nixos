{ config, lib, pkgs, userName, ... }:

{
  options.network.networkmanager.enable = lib.mkEnableOption "Enable NetworkManager";

  config = lib.mkIf config.network.networkmanager.enable {
    networking.networkmanager.enable = lib.mkDefault true;

    # Добавить пользователя в группу networkmanager для управления сетью
    users.users.${userName}.extraGroups = [ "networkmanager" ];
  };
}
