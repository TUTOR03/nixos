{ config, lib, ... }:

{
  xdg = {
    enable = lib.mkDefault true;
    mimeApps.enable = lib.mkDefault true;
  };
}
