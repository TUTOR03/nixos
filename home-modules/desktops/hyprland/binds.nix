{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bindd = [
      # Apps
      "$mod, T, Terminal, exec, uwsm app -- ghostty"
      "$mod, B, Browser, exec, uwsm app -- firefox"
      # Tiling
      "$mod, Q, Close window, killactive,"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];
  };
}
