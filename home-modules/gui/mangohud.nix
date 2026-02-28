{ config, lib, pkgs, ... }:

{
  options.gui.mangohud.enable = lib.mkEnableOption "MangoHud overlay для игр";

  config = lib.mkIf config.gui.mangohud.enable {
    programs.mangohud = {
      enable = true;
      settings = {
        # Основное
        fps = true;
        frame_timing = true;
        frametime_color = "00ff00";

        # CPU
        cpu_stats = true;
        cpu_temp = true;
        cpu_color = "2e97cb";
        cpu_text = "CPU";

        # GPU
        gpu_stats = true;
        gpu_temp = true;
        gpu_color = "2e9762";
        gpu_text = "GPU";

        # Память
        ram = true;
        vram = true;
        ram_color = "c26693";

        # Производительность
        throttling_status = true;
        throttling_color = "ff0000";

        # Ограничение FPS
        fps_limit_method = "late";
        fps_limit = [ 60 144 165 ];

        # Позиция и стиль
        position = "top-left";
        horizontal_stretch = 0;
        font_size = 18;
        background_alpha = 0.4;

        # Дополнительно
        wine_color = "eb5b34";
        vkbasalt = false;
      };
    };
  };
}
