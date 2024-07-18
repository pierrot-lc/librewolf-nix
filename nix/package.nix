{
  pkgs,
  lib,
}: {
  librewolf-pkg = pkgs.wrapFirefox pkgs.librewolf-unwrapped {
    inherit (pkgs.librewolf-unwrapped) extraPrefsFiles extraPoliciesFiles;
    wmClass = "LibreWolf";
    libName = "librewolf";
    nativeMessagingHosts = with pkgs; [bukubrow];
    extraPrefs = ''
      defaultPref("browser.aboutConfig.showWarning", false);
      defaultPref("browser.shell.checkDefaultBrowser", false);
      defaultPref("browser.translations.neverTranslateLanguages", "fr");
      defaultPref("extensions.autoDisableScopes", 0);
      defaultPref("extensions.autoDisableScopes", 0);
      defaultPref("extensions.install_origins.enabled", true);
      defaultPref("gfx.canvas.accelerated", true);
      defaultPref("gfx.webrender.enabled", true);
      defaultPref("webgl.disabled", false);
    '';
    extraPolicies = {
      # Extensions are obtained thanks to the guide here: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265.
      # Check `about:support` for extension/add-on ID strings. Then find the
      # installation url by donwloading the extension file (instead of
      # installing it directly). Always install the latest version of the
      # extensions by using the "latest" tag in the download url.
      ExtensionSettings = {
        "zotero@chnm.gmu.edu" = {
          install_url = "https://www.zotero.org/download/connector/dl?browser=firefox";
          installation_mode = "force_installed";
        };
        "bukubrow@samhh.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/3769984/bukubrow-latest.xpi";
          installation_mode = "force_installed";
        };
        "CanvasBlocker@kkapsner.de" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4262820/canvasblocker-latest.xpi";
          installation_mode = "force_installed";
        };
        "{44df5123-f715-9146-bfaa-c6e8d4461d44}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4312344/fakespot_fake_reviews_amazon-latest.xpi";
          installation_mode = "force_installed";
        };
        "{15bdb1ce-fa9d-4a00-b859-66c214263ac0}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/3990496/get_rss_feed_url-latest.xpi";
          installation_mode = "force_installed";
        };
        "{e7476172-097c-4b77-b56e-f56a894adca9}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4188531/minimaltwitter-latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
