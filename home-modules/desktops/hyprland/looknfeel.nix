{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$activeBorderColor" = "rgb(a89984)";
    "$inactiveBorderColor" = "rgba(595959aa)";

    general = {
      gaps_in = 5;
      gaps_out = 10;

      border_size = 2;

      gaps_workspaces = 0;

      "col.active_border" = "$activeBorderColor";
      "col.inactive_border" = "$inactiveBorderColor";

      resize_on_border = false;

      allow_tearing = false;

      layout = "dwindle";
    };

    decoration = {
      rounding = 0;
      shadow.enabled = false;
      blur.enabled = false;
    };

    group = {
      "col.border_active" = "$activeBorderColor";
      "col.border_inactive" = "$inactiveBorderColor";
      "col.border_locked_active" = -1;
      "col.border_locked_inactive" = -1;
    };

    animations = {
      enabled = true;

      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];

      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 0, 0, ease"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      focus_on_activate = true;
      anr_missed_pings = 3;
      new_window_takes_over_fullscreen = 1;
    };
  };
}
