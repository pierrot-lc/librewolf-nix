{
  pkgs,
  lib,
  config,
  ...
}: let
  package = import ./package.nix {
    inherit pkgs;
    inherit lib;
    inherit (config) nativeMessagingHosts;
  };
in {
  options = {
    librewolf-nix = {
      enable = lib.mkEnableOption "Enable librewolf-nix";
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
    home.packages = [package.librewolf-pkgs];
  };
}
