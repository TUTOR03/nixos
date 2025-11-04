{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bindd = [
      # Apps
      "$mod, T, Terminal, exec, uwsm app -- ghosty"
      "$mod, B, Browser, exec, uwsm app -- firefox"
      # Tiling
      "$mod, Q, Close window, exec, killactive"
    ];
  };
}
