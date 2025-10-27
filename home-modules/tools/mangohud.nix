{ config, lib, pkgs, ... }:

{
  options.tools.mangohud.enable = lib.mkEnableOption "Enable MangoHud";

  config = lib.mkIf config.tools.mangohud.enable {
    programs.mangohud = {
      enable = true;
      settings = {
        fps = lib.mkDefault true;
        frame_timing = lib.mkDefault true;
        cpu_stats = lib.mkDefault true;
        gpu_stats = lib.mkDefault true;
        ram = lib.mkDefault true;
        vram = lib.mkDefault true;
      };
    };
  };
}
