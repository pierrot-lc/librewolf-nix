final: prev: let
  package = import ./package.nix {
    pkgs = final;
    lib = final;
  };
in {
  librewolf-pkg = package.librewolf-pkg;
}
