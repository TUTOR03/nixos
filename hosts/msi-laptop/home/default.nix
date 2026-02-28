{ config, ... }:

{
  imports = [
    ./sops.nix
  ];

  desktops.hyprland = {
    enable = true;
    theme = "gruvbox";
  };

  gui = {
    browsers.firefox.enable = true;
    code-editors.vscode.enable = true;
    nautilus.enable = true;
  };

  cli = {
    bash.enable = true;
    ghostty.enable = true;
    yazi.enable = true;
    htop.enable = true;
  };

  dev.git.enable = true;
  dev.ssh.enable = true;

  programs.ssh.matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = config.sops.secrets."ssh/github".path;
    };
  };
}
