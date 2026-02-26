{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
  ];

  network.networkmanager.enable = true;

  hardwares = {
    bluetooth.enable = true;
    audio.enable = true;
    multimedia.enable = true;
  };

  system-tools = {
    fonts.enable = true;
    archive.enable = true;
    monitoring.enable = true;
    network.enable = true;
    utils.enable = true;
  };

  desktops.kde.enable = true;

  gaming = {
    steam.enable = true;
    lutris.enable = true;
    heroic.enable = true;
  };

  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
}
