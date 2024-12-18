![Librewolf Icon](./.icon.svg)

# My Librewolf Derivation

This is my own librewolf configuration implemented as a flake.

*Why librewolf instead of firefox?*

I got frustrated with Firefox. The default settings are not always configured
with the user privacy or user experience in mind. Librewolf on the other hand
have much more sane defaults so I might as well use librewolf.

This flake configures the followings:

- Bookmarks.
- Extensions.
- Preferences.
- Lowers some of the privacy settings on some specific sites (e.g. twitch does
  not work by default on librewolf without disabling fingerprinting).

If you'd like to build your own derivation of firefox or librewolf, feel free
to take inspiration from this repository. Swapping librewolf for firefox only
requires you to change `pkgs.librewolf-unwrapped` with `pkgs.firefox-unwrapped`
in `./nix/package.nix`.

## Installation

### Test Drive

You can directly try the package by running:

```console
nix run "github:pierrot-lc/librewolf-nix"
```

### Using the Overlay

The overlay will populate your list of available packages with the additional
`librewolf-nix` package (with the default configuration). Here's a minimal
example:

```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    librewolf-nix = {
      url = "github:pierrot-lc/librewolf-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    librewolf-nix,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
          librewolf-nix.overlays.${system}.default;
      ];
    };
  in {
    # The package is available at `pkgs.librewolf-nix`.
    ...
  };
}
```

### Using the Module

The module is useful to specify your own configuration of the package:

```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    librewolf-nix = {
      url = "github:pierrot-lc/librewolf-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    librewolf-nix,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    homeConfigurations = {
      username = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          inputs.librewolf-nix.hmModules.${system}.default
        ];
      };
    };
  };
}
```

```nix
# home.nix
{pkgs, ...}: {
  librewolf-nix = {
    enable = true;
    nativeMessagingHosts = with pkgs; [bukubrow];
  };
}
```
You can find the list of available options in `./nix/module.nix`.

## TODO

- Manage search engines. It looks like it should be done by modifying the
  `search.json.mozlz4` file, which is quite cumbersome. This is how HM is
  [doing](https://github.com/nix-community/home-manager/blob/60bb110917844d354f3c18e05450606a435d2d10/modules/programs/firefox/profiles/search.nix#L127).

## Links

- [Nix functions around firefox](https://ryantm.github.io/nixpkgs/builders/packages/firefox/)
- [Guide for building firefox with extensions and settings](https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265)
- [Firefox nix wrapper definition](https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/applications/networking/browsers/firefox/wrapper.nix)
- [Librewolf common settings](https://librewolf.net/docs/settings/)
- [Some good firefox configuration example](https://github.com/chayleaf/dotfiles/blob/543611983cd66449378ada55e33d6d0bff7a6e55/home/modules/firefox.nix#L8)
- [Firefox source code](https://searchfox.org/mozilla-central/source)
