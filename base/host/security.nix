{ config, lib, ... }:

{
  security.polkit.enable = lib.mkDefault true;
  security.sudo.wheelNeedsPassword = lib.mkDefault true;
}
