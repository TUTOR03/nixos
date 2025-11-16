{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
  ];

  desktops.kde.enable = true;

  gaming = {
    steam.enable = true;
    lutris.enable = true;
    heroic.enable = true;
  };

  system-tools = {
    archive.enable = true;
    monitoring.enable = true;
    network.enable = true;
    utils.enable = true;
  };

  # @TODO: Возможно вынести в отдельный модуль?
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
}
