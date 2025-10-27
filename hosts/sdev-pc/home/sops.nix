{ self, config, hostName, userName, pkgs, ... }:

{
  sops = {
    defaultSopsFile = "${self}/secrets/${hostName}/home.yaml";
    age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/${hostName}" ];

    secrets = {
      "ssh/github" = {
        path = "${config.home.homeDirectory}/.ssh/github";
        mode = "0600";
      };
    };
  };

  home.packages = with pkgs; [
    sops
    ssh-to-age
  ];
}
