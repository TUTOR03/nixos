{ config, lib, pkgs, ... }:
{
  options = {
    desktops.kde = {
      enable = lib.mkEnableOption "Enables KDE Plasma user configuration";
    };
  };

  config = lib.mkIf config.desktops.kde.enable {
    home.packages = with pkgs; [
      kdePackages.breeze
      kdePackages.breeze-gtk
      kdePackages.breeze-icons
    ];

    programs.plasma = {
      enable = true;

      shortcuts = {
        "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = lib.mkDefault "Alt+Shift";
      };

      workspace = {
        theme = lib.mkDefault "breeze-dark";
        colorScheme = lib.mkDefault "BreezeDark";
        lookAndFeel = lib.mkDefault "org.kde.breezedark.desktop";
        iconTheme = lib.mkDefault "breeze-dark";
        cursor.theme = lib.mkDefault "Breeze";
      };

      panels = lib.mkDefault [
        {
          location = "bottom";
          alignment = "center";
          height = 44;
          floating = false;
          hiding = "normalpanel";
          widgets = [
            {
              name = "org.kde.plasma.kickoff";
              config.General.icon = "nix-snowflake";
            }
            { name = "org.kde.plasma.pager"; }
            { name = "org.kde.plasma.icontasks"; }
            { name = "org.kde.plasma.systemtray"; }
            {
              digitalClock = {
                calendar.firstDayOfWeek = "monday";
                time.format = "24h";
                date.enable = true;
              };
            }
          ];
        }
      ];

      input.keyboard = {
        switchingPolicy = lib.mkDefault "global";
        layouts = lib.mkDefault [
          {
            layout = "us";
            displayName = "EN";
          }
          {
            layout = "ru";
            displayName = "RU";
          }
        ];
      };

      kwin = {
        virtualDesktops = {
          number = lib.mkDefault 4;
          rows = lib.mkDefault 1;
        };
        edgeBarrier = lib.mkDefault 0;
        effects = {
          shakeCursor.enable =  lib.mkDefault false;
          blur.enable = lib.mkDefault false;
          desktopSwitching.animation = "slide";
        };
      };

      configFile = {
        "dolphinrc"."General"."ShowFullPath" = lib.mkDefault true;
        "dolphinrc"."General"."RememberOpenedTabs" = lib.mkDefault false;
        "konsolerc"."TabBar"."TabBarPosition" = lib.mkDefault "Top";
      };

      session.sessionRestore.restoreOpenApplicationsOnLogin = lib.mkDefault "startWithEmptySession";
    };
  };
}
