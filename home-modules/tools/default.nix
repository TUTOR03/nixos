{ config, lib, ... }:
{
  imports = [
    ./bluetooth.nix
    ./file-managers.nix
    ./mangohud.nix
  ];
}
