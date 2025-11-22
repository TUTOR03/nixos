{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = lib.mkDefault "us,ru";
      kb_options = lib.mkDefault "grp:alt_shift_toggle";

      repeat_rate = lib.mkDefault 40;
      repeat_delay = lib.mkDefault 600;

      sensitivity = lib.mkDefault 0;
      follow_mouse = lib.mkDefault 1;
      touchpad = {
        scroll_factor = lib.mkDefault 0.4;
        natural_scroll = lib.mkDefault false;
      };
    };
  };
}
