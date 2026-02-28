{ config, lib, ... }:

{
  # Авторизации привилегированных действий без полного sudo
  security.polkit.enable = lib.mkDefault true;
  security.sudo.wheelNeedsPassword = lib.mkDefault true;
}
