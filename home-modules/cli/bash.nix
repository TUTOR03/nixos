{ flakePath, config, lib, pkgs, hostName, userName, ... }:

{
  options.cli.bash.enable = lib.mkEnableOption "Bash с алиасами и настройками";

  config = lib.mkIf config.cli.bash.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        # Шорткаты для NixOS
        rebuild = "sudo nixos-rebuild switch --flake ${flakePath}#${hostName}";
        rebuild-boot = "sudo nixos-rebuild boot --flake ${flakePath}#${hostName}";
        rebuild-test = "sudo nixos-rebuild test --flake ${flakePath}#${hostName}";
        rebuild-home = "home-manager switch --flake ${flakePath}#${userName}@${hostName}";
        update-flake = "nix flake update --flake ${flakePath}";
        nix-gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
        nix-optimize = "nix-store --optimize";
        nix-generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";

        # Навигация
        ls = "ls --color=auto";
        ll = "ls -lah";
        la = "ls -A";
        cls = "clear";
      };
    };

    programs.starship.enable = true;
  };
}
