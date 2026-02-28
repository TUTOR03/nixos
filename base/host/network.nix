{ config, lib, hostName, ... }:

{
  networking = {
    hostName = hostName;

    enableIPv6 = lib.mkDefault false;

    firewall = {
      enable = lib.mkDefault true;
      allowPing = lib.mkDefault true;
    };
  };
}
