![Librewolf Icon](./.icon.svg)

# My Librewolf Derivation

I used Firefox most of the time, but most of the default settings are not
headed toward privacy. Librewolf on the other hand have much more sane defaults
so I might as well use librewolf.

Things modified:

- Bookmarks.
- Extensions.
- Preferences.
- Lower some of the privacy settings on some specific sites (e.g. twitch does
  not work by default on librewolf without disabling fingerprinting).

## TODO

- Manage search engines. It looks like it should be done by modifying the
  `search.json.mozlz4` file, which is quite cumbersome. This is how HM is
  doing.

## Links

- [Nix functions around firefox](https://ryantm.github.io/nixpkgs/builders/packages/firefox/)
- [Guide for building firefox with extensions and settings](https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265)
- [Firefox nix wrapper definition](https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/applications/networking/browsers/firefox/wrapper.nix)
- [Librewolf common settings](https://librewolf.net/docs/settings/)
- [Some good firefox configuration example](https://github.com/chayleaf/dotfiles/blob/543611983cd66449378ada55e33d6d0bff7a6e55/home/modules/firefox.nix#L8)
