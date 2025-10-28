{ flakePath, config, lib, pkgs, hostName, userName, ... }:

{
  options = {
    shell.bash.enable = lib.mkEnableOption "Bash with some aliases";
  };

  config = lib.mkIf config.shell.bash.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        # NixOS system management
        rebuild = "sudo nixos-rebuild switch --flake ${flakePath}#${hostName}";
        rebuild-boot = "sudo nixos-rebuild boot --flake ${flakePath}#${hostName}";
        rebuild-test = "sudo nixos-rebuild test --flake ${flakePath}#${hostName}";

        # Home Manager
        rebuild-home = "home-manager switch --flake ${flakePath}#${userName}@${hostName}";

        # Flake operations
        update = "nix flake update ${flakePath}";

        # Garbage collection
        nix-gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
        nix-optimize = "nix-store --optimize";

        # System info
        generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";

        # Common shortcuts
        ls = lib.mkDefault "ls --color=auto";
        ll = lib.mkDefault "ls -lah";
        la = lib.mkDefault "ls -A";
        cls = lib.mkDefault "clear";
      };
    };

    # Cross-shell prompt
    programs.starship.enable = lib.mkDefault true;
  };
}
