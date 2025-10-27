{ config, lib, stateVersion, ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./locale.nix
    ./nix.nix
    ./security.nix
    ./services.nix
    ./user.nix
  ];

  system.stateVersion = stateVersion;
}
