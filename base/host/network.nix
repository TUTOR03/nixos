{ config, lib, hostName, ... }:

{
  networking = {
    hostName = hostName;
    networkmanager.enable = true;

    firewall = {
      enable = lib.mkDefault true;
      allowPing = lib.mkDefault true;
    };
  };
}
