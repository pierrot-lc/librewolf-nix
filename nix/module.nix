{
  pkgs,
  lib,
  config,
  ...
}: let
  package = import ./package.nix {
    inherit pkgs;
    inherit lib;
    inherit (config.librewolf-nix) nativeMessagingHosts;
    inherit (config.librewolf-nix) extraExtensions;
  };
in {
  options = {
    librewolf-nix = {
      enable = lib.mkEnableOption "Enable librewolf-nix";
      extraExtensions = lib.mkOption {
        type = lib.types.attrs;
        default = {};
        description = ''
          Extensions to additionally install. See ./extensions.nix to know how
          to declare them.

          Example:

          ```nix
          librewolf-nix = {
            enable = true;
            extraExtensions = {
              # Bukubrow
              "bukubrow@samhh.com" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/file/3769984/bukubrow-latest.xpi";
                installation_mode = "force_installed";
              };
            };
          };
          ```
        '';
      };
      nativeMessagingHosts = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = with pkgs; [];
        description = ''
          Additional packages containing native messaging hosts that should be made available to Firefox extensions.
        '';
      };
    };
  };

  config = lib.mkIf config.librewolf-nix.enable {
    home.packages = [package.librewolf-nix];
  };
}
