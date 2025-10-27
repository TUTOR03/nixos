{ config, lib, pkgs, ... }:

{
  options = {
    shell.ghostty.enable = lib.mkEnableOption "Ghostty terminal emulator";
  };

  config = lib.mkIf config.shell.ghostty.enable {
    home.packages = with pkgs; [
      ghostty
    ];

    home.file.".config/ghostty/config".source = lib.mkDefault ./config;
  };
}
