{
  description = "Modular NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    arkenfox-nixos = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-unstable
    , home-manager
    , nur
    , rust-overlay
    , vscode-extensions
    , arkenfox-nixos
    , disko
    , sops-nix
    , plasma-manager
    , ...
    }:

    let
      overlays = [
        nur.overlays.default
        rust-overlay.overlays.default
        vscode-extensions.overlays.default
      ];

      mkHostWithUser = { flakePath, system, hostName, userName, userEmail, stateVersion, extraHostModules ? [ ], extraHomeModules ? [ ] }:
        let
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };

          pkgs = import nixpkgs {
            inherit system;
            overlays = overlays ++ [
              (final: prev: {
                unstable = pkgs-unstable;
              })
            ];
            config.allowUnfree = true;
          };
        in
        {
          inherit hostName userName;

          host = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              {
                nixpkgs.pkgs = pkgs;
              }
              ./base/host
              ./host-modules
              ./hosts/${hostName}
            ] ++ extraHostModules;

            specialArgs = { inherit self flakePath hostName userName userEmail stateVersion; };
          };

          home = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [
              ./base/home
              ./home-modules
              ./hosts/${hostName}/home
            ] ++ extraHomeModules;

            extraSpecialArgs = { inherit self flakePath hostName userName userEmail stateVersion; };
          };
        };

      configs = [
        {
          flakePath = "/home/sdev/nixos";
          system = "x86_64-linux";
          hostName = "sdev-pc";
          userName = "sdev";
          userEmail = "stukalov.dev@proton.me";
          stateVersion = "25.05";
          extraHostModules = [
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
            ./hosts/sdev-pc/disko.nix
          ];
          extraHomeModules = [
            sops-nix.homeManagerModules.sops
            plasma-manager.homeModules.plasma-manager
            arkenfox-nixos.hmModules.arkenfox
          ];
        }
        {
          flakePath = "/home/sdev/nixos";
          system = "x86_64-linux";
          hostName = "msi-laptop";
          userName = "sdev";
          userEmail = "stukalov.dev@proton.me";
          stateVersion = "25.05";
          extraHostModules = [
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
            ./hosts/msi-laptop/disko.nix
          ];
          extraHomeModules = [
            sops-nix.homeManagerModules.sops
            plasma-manager.homeModules.plasma-manager
            arkenfox-nixos.hmModules.arkenfox
          ];
        }
      ];

      generatedConfigs = map mkHostWithUser configs;
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (cfg: { name = cfg.hostName; value = cfg.host; }) generatedConfigs
      );

      homeConfigurations = builtins.listToAttrs (
        map (cfg: { name = "${cfg.userName}@${cfg.hostName}"; value = cfg.home; }) generatedConfigs
      );
    };
}
