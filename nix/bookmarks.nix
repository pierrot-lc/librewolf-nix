# List of bookmarks, either in the toolbar or in the menu.
# See the expected format here: https://github.com/mozilla/policy-templates/blob/master/linux/policies.json#L33.
# The favicon are provided by a public API service, see https://stackoverflow.com/questions/46369862/get-the-favicon-of-a-url-and-display-it-firefox-web-ext.
{lib}: let
  # The following are functions that extract the domain name from an url and
  # use it to get the corresponding favicon with the API service.
  prefixes = ["https://" "http://"];
  removePrefixes = url: lib.foldr (prefix: str: lib.strings.removePrefix prefix str) url prefixes;
  extractDomainName = url: lib.lists.head (lib.strings.split "/" (removePrefixes url));
  getFavicon = url: "https://icons.duckduckgo.com/ip3/${extractDomainName url}.ico";
  addFavicon = attrset: attrset // {"Favicon" = getFavicon attrset."URL";};

  bookmarks = [
    {
      "Title" = "";
      "URL" = "https://youtube.com";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://music.youtube.com";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://www.twitch.tv";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://x.com";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://discord.com/channels/@me";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://messenger.com";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://web.whatsapp.com";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://github.com";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://wandb.ai";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://search.nixos.org/packages";
      "Placement" = "toolbar";
    }
    {
      "Title" = "Nixpkgs";
      "URL" = "https://github.com/NixOS/nixpkgs";
      "Placement" = "menu";
    }
    {
      "Title" = "";
      "URL" = "https://rss.flus.fr";
      "Placement" = "menu";
    }
    {
      "Title" = "IceDrive";
      "URL" = "https://icedrive.net/";
      "Placement" = "menu";
    }
  ];
in
  builtins.map addFavicon bookmarks
