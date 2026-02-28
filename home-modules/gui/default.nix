{ config, lib, ... }:
{
  imports = [
    ./browsers
    ./code-editors
    ./gaming.nix
    ./mangohud.nix
    ./nautilus.nix
  ];
}
