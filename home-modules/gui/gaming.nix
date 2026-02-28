{ config, lib, pkgs, ... }:

{
  options.gui.gaming.enable = lib.mkEnableOption "Инструменты для игр: Lutris, Wine, Proton";

  config = lib.mkIf config.gui.gaming.enable {
    home.packages = with pkgs; [
      # Лаунчеры
      lutris
      
      # GUI для управления Proton-GE
      protonup-qt

      # Оптимизация производительности при запуске игры
      gamemode
    ];
  };
}
