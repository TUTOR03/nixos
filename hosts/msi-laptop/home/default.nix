{ config, ... }:

{
  imports = [
    ./sops.nix
  ];

  desktops.hyprland = {
    enable = true;
    theme = "gruvbox";
  };

  browsers.firefox.enable = true;

  shell = {
    bash.enable = true;
    ghostty.enable = true;
  };

  code-editors.vscode.enable = true;

  tools = {
    file-managers = {
      yazi.enable = true;
      nautilus.enable = true;
    };
    bluetooth.enable = true;
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
