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

  caches = {
    hyprland.enable = true;
    nix-community.enable = true;
  };

  fonts.enable = true;

  desktops.kde.enable = true;

  gaming.steam.enable = true;

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
}
