# Extensions are obtained thanks to the guide here: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265.
# Check `about:support` for extension/add-on ID strings. Then find the
# installation url by donwloading the extension file (instead of installing it
# directly). Always install the latest version of the extensions by using the
# "latest" tag in the download url.
# See also:
# - https://github.com/mozilla/policy-templates/blob/master/linux/policies.json#L120
# - https://mozilla.github.io/policy-templates/#extensionsettings
{
  # Canvas Blocker
  "CanvasBlocker@kkapsner.de" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4262820/canvasblocker-latest.xpi";
    installation_mode = "force_installed";
    default_area = "menupanel";
  };
  # Defund Wikipedia
  "{9d6e7f41-8d33-4145-a164-5ca4358c7960}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/3617936/defund_wikipedia-latest.xpi";
    installation_mode = "force_installed";
    default_area = "menupanel";
  };
  # Get RSS Feed URL
  "{15bdb1ce-fa9d-4a00-b859-66c214263ac0}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/3990496/get_rss_feed_url-latest.xpi";
    installation_mode = "force_installed";
    default_area = "navbar";
  };
  # Nixpkgs PR Tracker
  "nixpkgs-pr-tracker@tahayassine.me" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4526315/nixpkgs_pr_tracker-latest.xpi";
    installation_mode = "force_installed";
    default_area = "menupanel";
  };
  # Privacy Badger
  "jid1-MnnxcxisBPnSXQ@jetpack" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4321653/privacy_badger17-latest.xpi";
    installation_mode = "force_installed";
    default_area = "menupanel";
  };
  # Refined GitHub
  "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4535455/refined_github-latest.xpi";
    installation_mode = "force_installed";
    default_area = "menupanel";
  };
  # Zotero Connector
  "zotero@chnm.gmu.edu" = {
    install_url = "https://www.zotero.org/download/connector/dl?browser=firefox";
    installation_mode = "force_installed";
    default_area = "navbar";
  };
}
