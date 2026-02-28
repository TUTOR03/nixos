{ config, lib, pkgs, ... }:

{
  options.dev.ssh.enable = lib.mkEnableOption "SSH client configuration";

  config = lib.mkIf config.dev.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    services.ssh-agent.enable = true;
  };
}
