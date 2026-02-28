{ config, lib, pkgs, userName, userEmail, ... }:

{
  options.dev.git.enable = lib.mkEnableOption "Git with basic configuration";

  config = lib.mkIf config.dev.git.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = userName;
      userEmail = userEmail;

      extraConfig = {
        init.defaultBranch = "master";
        pull.rebase = true;

        core = {
          editor = "nano";
        };

        color = {
          ui = "auto";
          branch = "auto";
          diff = "auto";
          status = "auto";
        };

        diff = {
          colorMoved = "default";
        };

        merge = {
          conflictstyle = "diff3";
        };
      };
    };

    home.packages = with pkgs; [
      git-lfs
      bfg-repo-cleaner
    ];
  };
}
