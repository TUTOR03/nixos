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

  # Генерация опций
  cacheOptions = lib.mapAttrs' (name: _:
    lib.nameValuePair "${name}.enable" (lib.mkEnableOption "${name} binary cache")
  ) caches;

  # Генерация конфига для каждого кэша
  mkCacheConfig = name: data: lib.mkIf config.caches.${name}.enable {
    nix.settings = {
      substituters = [ data.url ];
      trusted-public-keys = [ data.key ];
    };
  };

in
{
  options.caches = cacheOptions;

  config = lib.mkMerge (lib.mapAttrsToList mkCacheConfig caches);
}
