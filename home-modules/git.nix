{ config, lib, pkgs, userName, userEmail, ... }:

{
  options = {
    git = {
      enable = lib.mkEnableOption "Git with basic configuration";
    };
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = lib.mkDefault userName;
      userEmail = lib.mkDefault userEmail;

      extraConfig = {
        init.defaultBranch = lib.mkDefault "master";
        pull.rebase = lib.mkDefault true;

        core = {
          editor = lib.mkDefault "nano";
        };

        color = {
          ui = lib.mkDefault "auto";
          branch = lib.mkDefault "auto";
          diff = lib.mkDefault "auto";
          status = lib.mkDefault "auto";
        };

        diff = {
          colorMoved = lib.mkDefault "default";
        };

        merge = {
          conflictstyle = lib.mkDefault "diff3";
        };
      };
    };

    home.packages = with pkgs; [
      git-lfs
      bfg-repo-cleaner
    ];
  };
}
