{ config, ... }:

{
  imports = [
    ./sops.nix
  ];

  desktops.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,1";

    "$mod" = "SUPER";

    bind = [
      "$mod, T, exec, kitty"
    ];
  };

  browsers = {
    firefox.enable = true;
  };

  shell = {
    bash.enable = true;
    ghostty.enable = true;
  };

  git.enable = true;
  ssh.enable = true;
  programs.ssh.matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = config.sops.secrets."ssh/github".path;
    };
  };
}
