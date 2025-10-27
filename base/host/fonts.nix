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
      dejavu_fonts
      liberation_ttf
      roboto
      roboto-mono
      source-code-pro
      freefont_ttf
      unifont

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra

      source-han-sans
      source-han-serif

      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.hack
      nerd-fonts.roboto-mono
      nerd-fonts.iosevka
    ];
  };

  environment.systemPackages = with pkgs; [
    fontconfig
    freetype
  ];
}
