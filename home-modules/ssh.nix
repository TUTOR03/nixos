{ config, lib, pkgs, ... }:

{
  options = {
    ssh = {
      enable = lib.mkEnableOption "SSH client configuration";
    };
  };

  config = lib.mkIf config.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    services.ssh-agent.enable = lib.mkDefault true;
  };
}
