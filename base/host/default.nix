{ config, lib, stateVersion, ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./security.nix
    ./services.nix
    ./user.nix
  ];

  system.stateVersion = stateVersion;
}
