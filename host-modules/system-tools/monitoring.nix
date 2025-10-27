{ config, lib, pkgs, ... }:

{
  options = {
    system-tools.monitoring = {
      enable = lib.mkEnableOption "System monitoring tools";
    };
  };

  config = lib.mkIf config.system-tools.monitoring.enable {
    environment.systemPackages = with pkgs; [
      htop
      btop
    ];

    programs.coolercontrol.enable = true;
  };
}
