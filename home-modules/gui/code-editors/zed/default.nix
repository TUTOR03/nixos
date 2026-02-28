{ config, lib, pkgs, ... }:

{
  options.gui.code-editors.zed.enable = lib.mkEnableOption "Zed editor";

  config = lib.mkIf config.gui.code-editors.zed.enable {
    home.packages = with pkgs; [
      zed-editor
    ];

    xdg.configFile."zed/settings.json".source = ./settings.json;
  };
}
