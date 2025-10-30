{ ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
  ];

  desktops.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,1";

    "$mod" = "SUPER";

    bind = [
      "$mod, T, exec, kitty"
    ];
  };
}
