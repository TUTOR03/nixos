{ config, lib, pkgs, ... }:

{
  options.cli.network-tools = {
    enable = lib.mkEnableOption "TUI приложения для WiFi и Bluetooth";
  };

  config = lib.mkIf config.cli.network-tools.enable {
    home.packages = with pkgs; [
      # WiFi TUI manager
      impala

      # Bluetooth TUI manager
      bluetui
    ];
  };
}
