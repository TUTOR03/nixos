{ config, lib, pkgs, ... }:

{
  options.dev.ssh.enable = lib.mkEnableOption "SSH client configuration";

  config = lib.mkIf config.dev.ssh.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          forwardAgent = false;
          addKeysToAgent = "yes";
          compression = false;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          hashKnownHosts = false;
          controlMaster = "no";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
        };
      };
    };

    services.ssh-agent.enable = true;
  };
}
