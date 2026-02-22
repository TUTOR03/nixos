{ config, lib, pkgs, ... }:

{
  options.system-tools.fonts.enable = lib.mkEnableOption "Enable fonts configuration";

  config = lib.mkIf config.system-tools.fonts.enable {
    fonts = {
      enableDefaultPackages = lib.mkDefault true;
      fontDir.enable = lib.mkDefault true;

      fontconfig = {
        enable = lib.mkDefault true;
        antialias = lib.mkDefault true;
        hinting = {
          enable = lib.mkDefault true;
          style = lib.mkDefault "full";
        };
        subpixel = {
          rgba = lib.mkDefault "rgb";
          lcdfilter = lib.mkDefault "default";
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
        google-fonts
      ];
    };

    environment.systemPackages = with pkgs; [
      fontconfig
      freetype
    ];
  };
}
