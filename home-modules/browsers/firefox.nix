{ config, pkgs, lib, ... }:

{
  options = {
    browsers.firefox.enable = lib.mkEnableOption "Enable Firefox with combined Arkenfox and custom settings";
  };

  config = lib.mkIf config.browsers.firefox.enable {

    programs.firefox = {
      enable = true;
      package = pkgs.firefox;

      policies = {
        DisableTelemetry = lib.mkDefault true;
        DisableFirefoxStudies = lib.mkDefault true;
        DisablePocket = lib.mkDefault true;
        DisableFeedbackCommands = lib.mkDefault true;
        DisableCrashReporter = lib.mkDefault true;
        DisableProfileImport = lib.mkDefault true;
        AppAutoUpdate = lib.mkDefault false;
        DisableAppUpdate = lib.mkDefault true;
        DisableAccounts = lib.mkDefault true;
        PasswordManagerEnabled = lib.mkDefault false;
        OfferToSaveLogins = lib.mkDefault false;
        AutofillCreditCardEnabled = lib.mkDefault false;
        SearchSuggestEnabled = lib.mkDefault true;
        SuggestBookmarks = lib.mkDefault false;
        SuggestHistory = lib.mkDefault false;
        DisablePush = lib.mkDefault false;
        CaptivePortal = lib.mkDefault true;
        DNSOverHTTPS = lib.mkDefault {
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
            force = lib.mkDefault true;
            default = lib.mkDefault "ddg";
            privateDefault = lib.mkDefault "ddg";
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

          extensions.packages = lib.mkDefault (with pkgs.nur.repos.rycee.firefox-addons; [
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
