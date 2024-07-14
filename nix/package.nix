{
  pkgs,
  lib,
}: {
  librewolf-pkg = pkgs.wrapFirefox pkgs.librewolf-unwrapped {
    inherit (pkgs.librewolf-unwrapped) extraPrefsFiles extraPoliciesFiles;
    wmClass = "LibreWolf";
    libName = "librewolf";
    nativeMessagingHosts = with pkgs; [];
    extraPrefs = ''
      defaultPref("extensions.autoDisableScopes", 0);
      defaultPref("browser.aboutConfig.showWarning", false);
      defaultPref("browser.shell.checkDefaultBrowser", false);
      defaultPref("extensions.autoDisableScopes", 0);
      defaultPref("extensions.install_origins.enabled", true);
      defaultPref("gfx.canvas.accelerated", true);
      defaultPref("gfx.webrender.enabled", true);
      defaultPref("webgl.disabled", false);
    '';
  };
}
