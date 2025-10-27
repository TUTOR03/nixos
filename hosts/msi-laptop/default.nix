{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./sops.nix
  ];

  desktops.kde.enable = true;

  gaming = {
    steam.enable = true;
    heroic.enable = true;
  };

  system-tools = {
    archive.enable = true;
    monitoring.enable = true;
    network.enable = true;
    utils.enable = true;
  };
}
