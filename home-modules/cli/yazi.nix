{ config, lib, pkgs, ... }:

{
  options.cli.yazi.enable = lib.mkEnableOption "Yazi TUI файловый менеджер";

  config = lib.mkIf config.cli.yazi.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;

      settings = {
        manager = {
          ratio = [ 1 3 4 ];
          show_hidden = true;
          show_symlink = true;
          sort_by = "alphabetical";
          sort_sensitive = false;
          sort_reverse = false;
          sort_dir_first = true;
        };

        preview = {
          tab_size = 2;
          max_width = 600;
          max_height = 900;
          cache_dir = "";
          image_filter = "triangle";
          image_quality = 75;
        };

        opener = {
          edit = [
            { run = "$EDITOR \"$@\""; block = true; desc = "Edit with $EDITOR"; }
          ];
          open = [
            { run = "xdg-open \"$@\""; desc = "Open with default app"; }
          ];
        };

        open = {
          rules = [
            { mime = "text/*"; use = "edit"; }
            { mime = "application/json"; use = "edit"; }
            { name = "*"; use = "open"; }
          ];
        };
      };

      keymap = {
        manager.prepend_keymap = [
          { on = [ "g" "h" ]; run = "cd ~"; desc = "Go home"; }
          { on = [ "g" "c" ]; run = "cd ~/.config"; desc = "Go config"; }
          { on = [ "g" "d" ]; run = "cd ~/Downloads"; desc = "Go downloads"; }
          { on = [ "g" "D" ]; run = "cd ~/Documents"; desc = "Go documents"; }
        ];
      };
    };
  };
}
