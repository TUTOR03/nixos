{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
  ];

  network.networkmanager.enable = true;

  hw = {
    bluetooth.enable = true;
    audio.enable = true;
  };

  fonts.enable = true;

  caches = {
    hyprland.enable = true;
    nix-community.enable = true;
  };

  desktops.hyprland.enable = true;

  gaming.steam.enable = true;
}
