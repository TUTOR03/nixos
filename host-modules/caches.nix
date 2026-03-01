{ config, lib, ... }:

{
  options.caches = {
    hyprland = {
      enable = lib.mkEnableOption "Hyprland binary cache";
    };

    nix-community = {
      enable = lib.mkEnableOption "Nix Community binary cache";
    };
  };

  config = {
    nix.settings = lib.mkMerge [
      (lib.mkIf config.caches.hyprland.enable {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxQMzvd+8n8hGRU3sKvXKJgW05YnP7G1GK98O7UQ=" ];
      })

      (lib.mkIf config.caches.nix-community.enable {
        substituters = [ "https://nix-community.cachix.org" ];
        trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
      })
    ];
  };
}
