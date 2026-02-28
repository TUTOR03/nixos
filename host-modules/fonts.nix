{ config, lib, pkgs, ... }:

{
  options.fonts.enable = lib.mkEnableOption "Конфигурация шрифтов";

  config = lib.mkIf config.fonts.enable {
    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;

      fontconfig = {
        enable = true;
        antialias = true;
        hinting = {
          enable = true;
          style = "full";
        };
        subpixel = {
          rgba = "rgb";
          lcdfilter = "default";
        };
      };

      packages = with pkgs; [
        roboto
        roboto-mono
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        noto-fonts-extra
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
        nerd-fonts.hack
      ];
    };

    environment.systemPackages = with pkgs; [
      fontconfig
      freetype
      font-manager
    ];
  };
}
