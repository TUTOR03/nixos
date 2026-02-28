{ config, pkgs, lib, ... }:

{
  options.gui.browsers.firefox.enable = lib.mkEnableOption "Firefox с arkenfox и настройками";

  config = lib.mkIf config.gui.browsers.firefox.enable {

    programs.firefox = {
      enable = true;
      package = pkgs.firefox;

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFeedbackCommands = true;
        DisableCrashReporter = true;
        DisableProfileImport = true;
        AppAutoUpdate = false;
        DisableAppUpdate = true;
        DisableAccounts = true;
        PasswordManagerEnabled = false;
        OfferToSaveLogins = false;
        AutofillCreditCardEnabled = false;
        SearchSuggestEnabled = true;
        SuggestBookmarks = false;
        SuggestHistory = false;
        DisablePush = false;
        CaptivePortal = true;
        DNSOverHTTPS = {
          Enabled = true;
          ProviderURL = "https://dns.quad9.net/dns-query";
          Locked = false;
        };
      };

      arkenfox = {
        enable = true;
        version = "140.0";
      };

      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;

          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";
          };

          arkenfox = {
            enable = true;

            "0000".enable = true;
            "0100" = {
              enable = true;
              "0102"."browser.startup.page".value = 3;
              "0103"."browser.startup.homepage".value = "about:blank";
            };
            "0200".enable = true;
            "0300".enable = true;
            "0400".enable = true;
            "0600".enable = true;
            "0700".enable = true;
            "0800".enable = true;
            "0900".enable = true;
            "1000".enable = true;
            "1200".enable = true;
            "1600".enable = true;
            "1700".enable = true;
            "2400".enable = true;
            "2600".enable = true;
            "2700".enable = true;
            "5000".enable = true;
            "8500".enable = true;
            "9000".enable = true;
          };

          extensions.packages = (with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            bitwarden
            skip-redirect
            user-agent-string-switcher
          ]);
        };
      };
    };

    xdg.mimeApps = {
      defaultApplications = {
        "text/html" = [ "firefox.desktop" ];
        "application/xhtml+xml" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/ftp" = [ "firefox.desktop" ];
        "application/pdf" = [ "firefox.desktop" ];
      };
    };
  };
}
