{ config, lib, pkgs, userName, ... }:

{
  options.hw.printing.enable = lib.mkEnableOption "Enable printing and scanning support";

  config = lib.mkIf config.hw.printing.enable {
    services = {
      # CUPS сервер печати
      printing = {
        enable = true;
        drivers = [
          pkgs.hplip
          pkgs.gutenprint
          pkgs.splix
          pkgs.cups-bjnp
          pkgs.hplipWithPlugin
        ];
      };

      # SANE daemon для сканеров
      saned.enable = true;
    };

    users.users.${userName}.extraGroups = [ "scanner" "lp" ];
  };
}
