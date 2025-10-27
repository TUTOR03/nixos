{ config, pkgs, lib, ... }:

{
  options = {
    code-editors.vscode.enable = lib.mkEnableOption "VSCode with default extensions";
  };

  config = lib.mkIf config.code-editors.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;

      profiles.default.extensions = with pkgs.vscode-marketplace; [
        # Rust
        rust-lang.rust-analyzer

        # Svelte
        svelte.svelte-vscode

        # Nix
        bbenoist.nix
        jnoortheen.nix-ide

        # File formats
        redhat.vscode-yaml
        tamasfe.even-better-toml
        jock.svg
        shanoor.vscode-nginx
        tomoki1207.pdf
        davidanson.vscode-markdownlint
        yzane.markdown-pdf

        # Tools
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        ms-azuretools.vscode-docker
        ms-vscode.makefile-tools
        eamodio.gitlens
        mhutchie.git-graph
        adpyke.codesnap
        ms-vscode.hexeditor
        ms-vsliveshare.vsliveshare
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode-remote.remote-wsl
        ms-vscode.remote-explorer
        ms-playwright.playwright

        # UI
        pkief.material-icon-theme
        wix.vscode-import-cost
        yoavbls.pretty-ts-errors
        sainnhe.gruvbox-material
      ] ++ (with pkgs.vscode-extensions; [
        vadimcn.vscode-lldb
      ]);
    };

    home.file.".config/Code/User/settings.json".source = lib.mkDefault ./settings.json;
    home.file.".config/Code/User/keybindings.json".source = lib.mkDefault ./keybindings.json;
  };
}
