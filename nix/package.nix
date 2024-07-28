{
  pkgs,
  lib,
}: let
  bookmarks = import ./bookmarks.nix {inherit lib;};
  extensions = import ./extensions.nix;
in {
  librewolf-pkg = pkgs.wrapFirefox pkgs.librewolf-unwrapped {
    inherit (pkgs.librewolf-unwrapped) extraPrefsFiles extraPoliciesFiles;
    wmClass = "LibreWolf";
    libName = "librewolf";
    nativeMessagingHosts = with pkgs; [bukubrow];
    # Extra prefs can be found at `about:config`.
    extraPrefs = /* javascript */ ''
        pref("accessibility.force_disabled", 1);
        pref("browser.aboutConfig.showWarning", false);
        pref("browser.bookmarks.addedImportButton", false);
        pref("browser.migrate.bookmarks-file.enabled", false);
        pref("browser.shell.checkDefaultBrowser", false);
        pref("browser.toolbars.bookmarks.visibility", "newtab");
        pref("browser.translations.neverTranslateLanguages", "fr");
        pref("extensions.autoDisableScopes", 0);
        pref("extensions.install_origins.enabled", true);
        pref("general.autoScroll", true);
        pref("gfx.canvas.accelerated", true);
        pref("gfx.webrender.enabled", true);
        pref("middlemouse.paste", false);
        pref("webgl.disabled", false);

        // Privacy relaxation.
        pref("privacy.clearOnShutdown.cache", false);
        pref("privacy.clearOnShutdown.cookies", false);
        pref("privacy.clearOnShutdown.history", false);
        pref("privacy.clearOnShutdown.sessions", false);
        pref("privacy.resistFingerprinting.exemptedDomains", "*.discord.com,*.twitch.tv,*.wandb.ai,*.x.com");
      '';

    # Documentation about policies options can be found at `about:policies#documentation`.
    # You can also have a look here: https://github.com/mozilla/policy-templates/.
    extraPolicies = {
      Bookmarks = bookmarks;
      ExtensionSettings = extensions;

      Cookies = {
        Allow = [
          "https://claude.ai"
          "https://discord.com"
          "https://wandb.ai/"
          "https://web.whatsapp.com/"
          "https://www.twitch.tv/"
        ];
      };

      EnableTrackingProtection = {
        Exceptions = [
          "https://claude.ai"
        ];
      };
    };
  };
}
