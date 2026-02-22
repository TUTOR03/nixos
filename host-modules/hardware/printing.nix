{ config, lib, pkgs, userName, ... }:

{
  options.hardware.printing.enable = lib.mkEnableOption "Enable printing and scanning support";

  config = lib.mkIf config.hardware.printing.enable {
    services = {
      # CUPS сервер печати
      printing = {
        enable = lib.mkDefault true;
        drivers = [ ];
      };

      # SANE daemon для сканеров
      saned.enable = lib.mkDefault true;
    };

    users.users.${userName}.extraGroups = [ "scanner" "lp" ];
  };
}
