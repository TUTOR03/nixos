{ pkgs, ... }:

{
  programs.walker = {
    enable = true;
  };

  home.file.".config/walker/config.toml".source = ./config.toml;
  home.file.".config/walker/themes/gruvbox/style.css".source = ./style.css;
}
