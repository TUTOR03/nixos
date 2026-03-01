{ config, lib, ... }:

let
  caches = {
    hyprland = {
      url = "https://hyprland.cachix.org";
      key = "hyprland.cachix.org-1:a7pgxQMzvd+8n8hGRU3sKvXKJgW05YnP7G1GK98O7UQ=";
    };

    nix-community = {
      url = "https://nix-community.cachix.org";
      key = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
    };
  };

  # Генерация вложенных опций для каждого кэша
  mkCacheOptions = name: {
    enable = lib.mkEnableOption "${name} binary cache";
  };

  # Генерация конфига для каждого кэша
  mkCacheConfig = name: data: lib.mkIf config.caches.${name}.enable {
    nix.settings = {
      substituters = [ data.url ];
      trusted-public-keys = [ data.key ];
    };
  };

in
{
  options.caches = lib.mapAttrs mkCacheOptions caches;

  config = lib.mkMerge (lib.mapAttrsToList mkCacheConfig caches);
}
