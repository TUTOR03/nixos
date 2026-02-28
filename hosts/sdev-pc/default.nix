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

  desktops.kde.enable = true;

  gaming.steam.enable = true;

  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
}
