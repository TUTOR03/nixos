{ config, lib, pkgs, ... }:

{
  options = {
    system-tools.network.enable = lib.mkEnableOption "Network analysis and debugging tools";
  };

  config = lib.mkIf config.system-tools.network.enable {
    environment.systemPackages = with pkgs; [
      nmap
      tcpdump
      wireshark
      iperf3
      dig
      whois
      curl
      wget
      iftop
    ];
  };
}
