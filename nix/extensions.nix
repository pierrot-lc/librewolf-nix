# Extensions are obtained thanks to the guide here: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265.
# Check `about:support` for extension/add-on ID strings. Then find the
# installation url by donwloading the extension file (instead of installing it
# directly). Always install the latest version of the extensions by using the
# "latest" tag in the download url.
{
  # Bukubrow
  "bukubrow@samhh.com" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/3769984/bukubrow-latest.xpi";
    installation_mode = "force_installed";
  };
  # Canvas Blocker
  "CanvasBlocker@kkapsner.de" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4262820/canvasblocker-latest.xpi";
    installation_mode = "force_installed";
  };
  # Defund Wikipedia
  "{9d6e7f41-8d33-4145-a164-5ca4358c7960}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/3617936/defund_wikipedia-1.2.xpi";
    installation_mode = "force_installed";
  };
  # Fakespot
  "{44df5123-f715-9146-bfaa-c6e8d4461d44}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4312344/fakespot_fake_reviews_amazon-latest.xpi";
    installation_mode = "force_installed";
  };
  # Get RSS Feed URL
  "{15bdb1ce-fa9d-4a00-b859-66c214263ac0}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/3990496/get_rss_feed_url-latest.xpi";
    installation_mode = "force_installed";
  };
  # Minimal Twitter
  "{e7476172-097c-4b77-b56e-f56a894adca9}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4188531/minimaltwitter-latest.xpi";
    installation_mode = "force_installed";
  };
  # Privacy Badger
  "jid1-MnnxcxisBPnSXQ@jetpack" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4321653/privacy_badger17-latest.xpi";
    installation_mode = "force_installed";
  };
  # Refined GitHub
  "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = {
    install_url = "https://addons.mozilla.org/firefox/downloads/file/4317387/refined_github-latest.xpi";
    installation_mode = "force_installed";
  };
  # Zotero Connector
  "zotero@chnm.gmu.edu" = {
    install_url = "https://www.zotero.org/download/connector/dl?browser=firefox";
    installation_mode = "force_installed";
  };
}
