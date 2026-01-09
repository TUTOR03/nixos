{ config, lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
      hinting.style = "full";
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

      google-fonts
    ];
  };

  environment.systemPackages = with pkgs; [
    fontconfig
    freetype
  ];
}
