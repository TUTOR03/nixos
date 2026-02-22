{ config, ... }:

{
  imports = [
    ./sops.nix
  ];

  desktops.hyprland.enable = true;
  desktops.xdg-user-dirs.enable = true;

  browsers.firefox.enable = true;

  shell = {
    bash.enable = true;
    ghostty.enable = true;
  };

  code-editors.vscode.enable = true;

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
