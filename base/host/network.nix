{ config, lib, hostName, ... }:

{
  networking = {
    hostName = hostName;

    firewall = {
      enable = lib.mkDefault true;
      allowPing = lib.mkDefault true;
    };
  };
}
