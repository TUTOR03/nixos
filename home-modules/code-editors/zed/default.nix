{ config, lib, pkgs, ... }:

{
  options = {
    code-editors.zed.enable = lib.mkEnableOption "Zed editor";
  };

  config = lib.mkIf config.code-editors.zed.enable {
    home.packages = with pkgs; [
      zed-editor
    ];

    home.file.".config/zed/settings.json".source = lib.mkDefault ./settings.json;
  };
}
