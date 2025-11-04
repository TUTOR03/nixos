{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,ru";
      kb_options = "grp:alt_shift_toggle";

      repeat_rate = 40;
      repeat_delay = 600;

      sensitivity = 0;
      follow_mouse = 1;
      touchpad = {
        scroll_factor = 0.4;
        natural_scroll = false;
      };
    };

    gestures = {
      workspace_swipe = true;
    };
  };
}
