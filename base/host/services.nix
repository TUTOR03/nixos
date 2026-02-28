{ config, lib, ... }:

{
  services = {
    fstrim = {
      enable = lib.mkDefault true;
      interval = lib.mkDefault "weekly";
    };

    udev.enable = lib.mkDefault true;

    dbus.enable = lib.mkDefault true;

    journald.extraConfig = ''
      SystemMaxUse=500M
      MaxRetentionSec=7day
    '';
  };

  # Уменьшаем время ожидания остановки сервисов
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';
}
