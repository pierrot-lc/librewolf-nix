{
  pkgs,
  lib,
  nativeMessagingHosts ? with pkgs; [],
  extraExtensions ? {},
}: let
  bookmarks = import ./bookmarks.nix {inherit lib;};
  extensions = import ./extensions.nix // extraExtensions;
in {
  librewolf-nix = pkgs.wrapFirefox pkgs.librewolf-unwrapped {
    inherit (pkgs.librewolf-unwrapped) extraPrefsFiles extraPoliciesFiles;
    wmClass = "LibreWolf";
    libName = "librewolf";
    inherit nativeMessagingHosts;
    # Extra prefs can be found at `about:config`.
    extraPrefs = /* javascript */ ''
        pref("accessibility.force_disabled", 1);
        pref("browser.aboutConfig.showWarning", false);
        pref("browser.bookmarks.addedImportButton", false);
        pref("browser.migrate.bookmarks-file.enabled", false);
        pref("browser.shell.checkDefaultBrowser", false);
        pref("browser.tabs.insertAfterCurrent", true);
        pref("browser.toolbars.bookmarks.visibility", "newtab");
        pref("browser.translations.neverTranslateLanguages", "fr");
        pref("dom.text_fragments.create_text_fragment.enabled", true);
        pref("extensions.autoDisableScopes", 0);
        pref("extensions.install_origins.enabled", true);
        pref("general.autoScroll", true);
        pref("gfx.canvas.accelerated", true);
        pref("gfx.webrender.enabled", true);
        pref("middlemouse.paste", false);
        pref("webgl.disabled", false);

        // Privacy relaxation.
        pref("privacy.clearOnShutdown_v2.cache", false);
        pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false);
        pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false);
        pref("privacy.clearOnShutdown_v2.siteSettings", false)
        pref("privacy.resistFingerprinting.exemptedDomains", "*.twitch.tv,*.claude.ai");
      '';

    # Documentation about policies options can be found at `about:policies#documentation`.
    # You can also have a look here: https://github.com/mozilla/policy-templates/.
    extraPolicies = {
      Bookmarks = bookmarks;
      ExtensionSettings = extensions;

      Cookies = {
        Allow = [
          "https://discord.com"
          "https://web.whatsapp.com/"
        ];
      };

      EnableTrackingProtection = {
        Exceptions = [
        ];
      };
    };
  };
}
