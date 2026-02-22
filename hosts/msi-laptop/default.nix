{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
  ];

  network.networkmanager.enable = true;

  hardware = {
    bluetooth.enable = true;
    audio.enable = true;
    multimedia.enable = true;
  };

  system-tools.fonts.enable = true;

  caches.hyprland.enable = true;
  desktops.hyprland.enable = true;

  gaming.steam.enable = true;
}
