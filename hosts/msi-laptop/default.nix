{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
  ];

  caches.hyprland.enable = true;
  desktops.hyprland.enable = true;
}
