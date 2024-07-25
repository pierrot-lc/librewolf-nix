final: prev: let
  package = import ./package.nix {
    pkgs = final;
    lib = final.lib;
  };
in {
  librewolf-pkg = package.librewolf-pkg;
}
