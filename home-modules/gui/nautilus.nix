{ config, lib, pkgs, ... }:

{
  options.gui.nautilus.enable = lib.mkEnableOption "Nautilus файловый менеджер";

  config = lib.mkIf config.gui.nautilus.enable {
    home.packages = [ pkgs.nautilus ];

    dconf.settings = {
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        show-hidden-files = true;
        show-delete-permanently = true;
        click-policy = "single";
        search-view = "list-view";
      };

      "org/gnome/nautilus/list-view" = {
        default-zoom-level = "small";
        use-tree-view = true;
        default-visible-columns = [ "name" "size" "date_modified" "type" ];
      };

      "org/gnome/nautilus/icon-view" = {
        default-zoom-level = "standard";
      };
    };
  };
}
