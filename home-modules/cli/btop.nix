{ config, lib, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop;

    settings = {
      # Theme
      color_theme = "gruvbox";
      theme_background = false;
      truecolor = true;

      # Display
      rounded_corners = true;
      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";

      # Performance
      update_ms = 1000;

      # Processes
      proc_tree = true;
      proc_sorted = true;
      proc_reversed = false;
      proc_grouping = true;

      # CPU
      cpu_graph_lower = "auto";
      cpu_invert_lower = true;
      cpu_single_graph = false;

      # Memory
      mem_graph_lower = "auto";
      mem_invert_lower = true;

      # Network
      net_download = 100;
      net_upload = 100;

      # Disks
      disk_filter = false;
    };
  };

  # Gruvbox theme for btop
  xdg.configFile."btop/themes/gruvbox.theme".text = ''
    # Gruvbox theme for btop
    # Based on https://github.com/morhetz/gruvbox

    # Main background
    theme[main_bg]="#282828"

    # Main text color
    theme[main_fg]="#a89984"

    # Title color for boxes
    theme[title]="#ebdbb2"

    # Highlight color for keyboard shortcuts
    theme[hi_fg]="#d79921"

    # Background color of selected items
    theme[selected_bg]="#282828"

    # Foreground color of selected items
    theme[selected_fg]="#fabd2f"

    # Color of inactive/disabled text
    theme[inactive_fg]="#282828"

    # Color of text appearing on top of graphs
    theme[graph_text]="#585858"

    # Misc colors for processes box
    theme[proc_misc]="#98971a"

    # Box outline colors
    theme[cpu_box]="#a89984"
    theme[mem_box]="#a89984"
    theme[net_box]="#a89984"
    theme[proc_box]="#a89984"

    # Box divider line
    theme[div_line]="#a89984"

    # Temperature graph colors
    theme[temp_start]="#458588"
    theme[temp_mid]="#d3869b"
    theme[temp_end]="#fb4394"

    # CPU graph colors
    theme[cpu_start]="#b8bb26"
    theme[cpu_mid]="#d79921"
    theme[cpu_end]="#fb4934"

    # Mem/Disk free meter
    theme[free_start]="#4e5900"
    theme[free_mid]=""
    theme[free_end]="#98971a"

    # Mem/Disk cached meter
    theme[cached_start]="#458588"
    theme[cached_mid]=""
    theme[cached_end]="#83a598"

    # Mem/Disk available meter
    theme[available_start]="#d79921"
    theme[available_mid]=""
    theme[available_end]="#fabd2f"

    # Mem/Disk used meter
    theme[used_start]="#cc241d"
    theme[used_mid]=""
    theme[used_end]="#fb4934"

    # Download graph colors
    theme[download_start]="#3d4070"
    theme[download_mid]="#6c71c4"
    theme[download_end]="#a3a8f7"

    # Upload graph colors
    theme[upload_start]="#701c45"
    theme[upload_mid]="#b16286"
    theme[upload_end]="#d3869b"
  '';
}
