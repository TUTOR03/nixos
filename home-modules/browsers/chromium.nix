{ config, lib, pkgs, ... }:

{
  options = {
    browsers.chromium.enable = lib.mkEnableOption "Enables Chromium";
  };

  config = lib.mkIf config.browsers.chromium.enable {
    programs.chromium = {
      enable = true;
    };
  };
}
