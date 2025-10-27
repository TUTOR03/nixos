{ config, lib, ... }:

{
  time.timeZone = lib.mkDefault "Europe/Moscow";
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = lib.mkDefault "ru_RU.UTF-8";
    LC_IDENTIFICATION = lib.mkDefault "ru_RU.UTF-8";
    LC_MEASUREMENT = lib.mkDefault "ru_RU.UTF-8";
    LC_MONETARY = lib.mkDefault "ru_RU.UTF-8";
    LC_NAME = lib.mkDefault "ru_RU.UTF-8";
    LC_NUMERIC = lib.mkDefault "ru_RU.UTF-8";
    LC_PAPER = lib.mkDefault "ru_RU.UTF-8";
    LC_TELEPHONE = lib.mkDefault "ru_RU.UTF-8";
    LC_TIME = lib.mkDefault "ru_RU.UTF-8";
  };

  i18n.supportedLocales = lib.mkDefault [
    "en_US.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];

  console = {
    keyMap = lib.mkDefault "us";
    font = lib.mkDefault "cyr-sun16";
  };

  services.xserver.xkb = {
    layout = lib.mkDefault "us,ru";
    variant = lib.mkDefault "";
    options = lib.mkDefault "grp:alt_shift_toggle";
  };
}
