{ config, lib, ... }:
{
  imports = [
    ./binds.nix
    ./env.nix
    ./input.nix
    ./looknfeel.nix
    ./monitors.nix
    ./rules.nix
  ];
}
