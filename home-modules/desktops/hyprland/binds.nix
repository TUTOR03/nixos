{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bindd = [
      # Close windows
      "$mod, Q, Close window, killactive,"

      # Move focus with $mod + arrow keys
      "$mod, LEFT, Move focus left, movefocus, l"
      "$mod, RIGHT, Move focus right, movefocus, r"
      "$mod, UP, Move focus up, movefocus, u"
      "$mod, DOWN, Move focus down, movefocus, d"

      # Switch workspaces with $mod + [0-9]
      "$mod, code:10, Switch to workspace 1, workspace, 1"
      "$mod, code:11, Switch to workspace 2, workspace, 2"
      "$mod, code:12, Switch to workspace 3, workspace, 3"
      "$mod, code:13, Switch to workspace 4, workspace, 4"
      "$mod, code:14, Switch to workspace 5, workspace, 5"
      "$mod, code:15, Switch to workspace 6, workspace, 6"
      "$mod, code:16, Switch to workspace 7, workspace, 7"
      "$mod, code:17, Switch to workspace 8, workspace, 8"
      "$mod, code:18, Switch to workspace 9, workspace, 9"
      "$mod, code:19, Switch to workspace 10, workspace, 10"

      # Move active window to a workspace with $mod + SHIFT + [0-9]
      "$mod SHIFT, code:10, Move window to workspace 1, movetoworkspace, 1"
      "$mod SHIFT, code:11, Move window to workspace 2, movetoworkspace, 2"
      "$mod SHIFT, code:12, Move window to workspace 3, movetoworkspace, 3"
      "$mod SHIFT, code:13, Move window to workspace 4, movetoworkspace, 4"
      "$mod SHIFT, code:14, Move window to workspace 5, movetoworkspace, 5"
      "$mod SHIFT, code:15, Move window to workspace 6, movetoworkspace, 6"
      "$mod SHIFT, code:16, Move window to workspace 7, movetoworkspace, 7"
      "$mod SHIFT, code:17, Move window to workspace 8, movetoworkspace, 8"
      "$mod SHIFT, code:18, Move window to workspace 9, movetoworkspace, 9"
      "$mod SHIFT, code:19, Move window to workspace 10, movetoworkspace, 10"

      # Switch next/prev workspace with $mod + page up/down
      "$mod, page_up, Switch to next workspace, workspace, +1"
      "$mod, page_down, Switch to prev workspace, workspace, -1"

      # Move window to next/prev workspace with $mod + SHIFT + page up/down
      "$mod SHIFT, page_up, Move window to next workspace, movetoworkspace, +1"
      "$mod SHIFT, page_down, Move window to prev workspace, movetoworkspace, -1"

      # Resize active window
      "$mod, code:20, Expand window left, resizeactive, -100 0"
      "$mod, code:21, Shrink window left, resizeactive, 100 0"
      "$mod SHIFT, code:20, Shrink window up, resizeactive, 0 -100"
      "$mod SHIFT, code:21, Expand window down, resizeactive, 0 100"

      # Apps launcher
      "$mod, SPACE, Apps launcher, exec, walker"

      # Apps
      "$mod, T, Terminal, exec, uwsm app -- ghostty"
      "$mod, B, Browser, exec, uwsm app -- firefox"
    ];

    bindmd = [
      # Move/resize windows with cursor
      "$mod, mouse:272, Move window, movewindow"
      "$mod ALT, mouse:272, Resize window, resizewindow"
    ];
  };
}
