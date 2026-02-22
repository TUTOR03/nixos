{ config, lib, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = lib.mkDefault true;
      timeout = lib.mkDefault null;

      systemd-boot = {
        enable = lib.mkDefault true;
        configurationLimit = lib.mkDefault 7;
      };
    };
  };
}
