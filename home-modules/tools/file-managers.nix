{ config, lib, pkgs, ... }:

{
  options.tools.file-managers = {
    yazi.enable = lib.mkEnableOption "Yazi TUI файловый менеджер";
    nautilus.enable = lib.mkEnableOption "Nautilus GUI файловый менеджер";
  };

  config = lib.mkMerge [
    (lib.mkIf config.tools.file-managers.yazi.enable {
      home.packages = [ pkgs.yazi ];
    })

    (lib.mkIf config.tools.file-managers.nautilus.enable {
      home.packages = [ pkgs.nautilus ];
    })
  ];
}
