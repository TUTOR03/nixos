{ config, lib, pkgs, ... }:

{
  options.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config = lib.mkIf config.gaming.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = lib.mkDefault true;
      dedicatedServer.openFirewall = lib.mkDefault true;
      localNetworkGameTransfers.openFirewall = lib.mkDefault true;
    };

    environment.systemPackages = with pkgs; [
      steamcmd
      protonup-qt
    ];
  };
}
