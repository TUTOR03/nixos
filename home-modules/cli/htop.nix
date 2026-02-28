{ config, lib, pkgs, ... }:

{
  options.cli.htop.enable = lib.mkEnableOption "htop с настройками";

  config = lib.mkIf config.cli.htop.enable {
    programs.htop = {
      enable = true;
      settings = {
        tree_view = true;
        show_cpu_frequency = true;
        show_cpu_temperature = true;
        highlight_base_name = true;
        show_program_path = false;
        hide_kernel_threads = true;
        hide_userland_threads = true;
        sort_key = "PERCENT_CPU";
        sort_direction = -1;
      };
    };
  };
}
