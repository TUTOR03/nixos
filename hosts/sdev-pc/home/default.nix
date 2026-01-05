{ config, pkgs, ... }:

{
  imports = [
    ./sops.nix
  ];

  home.packages = with pkgs; [
    discord
    obsidian
    telegram-desktop
    qbittorrent
    vlc
  ];

  desktops.kde.enable = true;
  programs.plasma = {
    kscreenlocker = {
      autoLock = false;
      passwordRequiredDelay = 2;
    };

    powerdevil = {
      AC = {
        autoSuspend = {
          action = "nothing";
          idleTimeout = null;
        };
        dimDisplay.enable = false;
        powerButtonAction = "sleep";
        powerProfile = "performance";
        turnOffDisplay = {
          idleTimeout = 1800;
          idleTimeoutWhenLocked = 900;
        };
        whenLaptopLidClosed = "sleep";
        whenSleepingEnter = "standby";
      };

      general.pausePlayersOnSuspend = true;
    };
  };

  browsers = {
    firefox.enable = true;
  };
  programs.firefox.profiles.default = {
    bookmarks = {
      force = true;
      settings = [
        {
          toolbar = true;
          bookmarks = [
            {
              name = "TG";
              url = "https://web.telegram.org/k";
            }
            {
              name = "Max";
              url = "https://web.max.ru";
            }
            {
              name = "VPN";
              bookmarks = [
                {
                  name = "FI-VPN";
                  url = "https://vpnpanel.stdev.space:31811/zXHpPk07aRW7LXx/panel";
                }
              ];
            }
            {
              name = "Почта";
              bookmarks = [
                {
                  name = "Proton";
                  url = "https://proton.me";
                }
                {
                  name = "Yandex";
                  url = "https://mail.yandex.ru";
                }
                {
                  name = "Google";
                  url = "https://mail.google.com";
                }
              ];
            }
          ];
        }
      ];
    };
  };

  code-editors = {
    vscode.enable = true;
    zed.enable = true;
  };

  shell = {
    bash.enable = true;
    ghostty.enable = true;
  };

  tools = {
    mangohud.enable = true;
  };

  git.enable = true;
  ssh.enable = true;
  programs.ssh.matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = config.sops.secrets."ssh/github".path;
    };
  };
}
