{ config, lib, pkgs, ... }:

{
  options.tools.bluetooth.enable = lib.mkEnableOption "Bluetuith TUI Bluetooth менеджер";

  config = lib.mkIf config.tools.bluetooth.enable {
    home.packages = [ pkgs.bluetuith ];
  };
}
