{ pkgs, ... }:

{
  programs.walker = {
    enable = true;
    runAsService = true;
    config = { };
  };

  home.file.".config/walker/config.toml".source = ./config.toml;
  home.file.".config/walker/themes/gruvbox/style.css".source = ./style.css;
}
