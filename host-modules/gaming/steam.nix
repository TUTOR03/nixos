{ config, lib, ... }:

{
  options.gaming.steam.enable = lib.mkEnableOption "Steam с системными настройками";

  config = lib.mkIf config.gaming.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
