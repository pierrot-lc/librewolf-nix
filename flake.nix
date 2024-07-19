{
  description = "Librewolf derivation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    librewolf-overlay = import ./nix/overlay.nix;
  in
    flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          librewolf-overlay
        ];
      };
    in {
      packages = rec {
        librewolf = pkgs.librewolf-pkg;
        default = librewolf;
      };

      overlays = rec {
        librewolf = librewolf-overlay;
        default = librewolf;
      };
    });
}
