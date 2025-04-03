# List of bookmarks, either in the toolbar or in the menu.
# See the expected format here: https://github.com/mozilla/policy-templates/blob/master/linux/policies.json#L33.
# The favicon are provided by a public API service, see https://stackoverflow.com/questions/46369862/get-the-favicon-of-a-url-and-display-it-firefox-web-ext.
{lib}: let
  # The following are functions that extract the domain name from an url and
  # use it to get the corresponding favicon with the API service.
  prefixes = ["https://" "http://"];
  removePrefixes = url: lib.foldr (prefix: str: lib.strings.removePrefix prefix str) url prefixes;
  extractDomainName = url: url |> removePrefixes |> lib.strings.split "/" |> lib.lists.head;
  getFavicon = url: "https://icon.horse/icon/${extractDomainName url}"; # See https://icon.horse/.
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
      "URL" = "https://chat.mistral.ai/chat";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://www.perplexity.ai/";
      "Placement" = "toolbar";
    }
    {
      "Title" = "";
      "URL" = "https://rss.flus.fr/";
      "Placement" = "toolbar";
    }
    {
      "Title" = "Nixpkgs";
      "URL" = "https://github.com/NixOS/nixpkgs";
      "Placement" = "menu";
    }
    {
      "Title" = "Flus";
      "URL" = "https://rss.flus.fr";
      "Placement" = "menu";
    }
    {
      "Title" = "IceDrive";
      "URL" = "https://icedrive.net/";
      "Placement" = "menu";
    }
    {
      "Title" = "Excalidraw";
      "URL" = "https://excalidraw.com/";
      "Placement" = "menu";
    }
    {
      "Title" = "Daily Papers";
      "URL" = "https://huggingface.co/papers";
      "Placement" = "menu";
    }

    # Inria bookmarks.
    {
      "Title" = "Numin";
      "URL" = "https://numin.inria.fr/portal/login";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Zimbra";
      "URL" = "https://zimbra.inria.fr";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Nef";
      "URL" = "https://wiki.inria.fr/ClustersSophia/Clusters_Home";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Nef - Wiki";
      "URL" = "https://wiki.inria.fr/ClustersSophia/FAQ_new_config";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Monika Nef";
      "URL" = "https://nef-frontal.inria.fr/monika";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Ganglia Nef";
      "URL" = "https://nef-services.inria.fr/ganglia/";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Grid5000";
      "URL" = "https://www.grid5000.fr/w/Grid5000:Home";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Grid5000 Getting Started";
      "URL" = "https://www.grid5000.fr/w/Production:Getting_Started";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Print";
      "URL" = "https://print.inria.fr";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Moodle";
      "URL" = "https://lms.univ-cotedazur.fr";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "Mattermost";
      "URL" = "https://mattermost.inria.fr/coati/channels/off-topic";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
    {
      "Title" = "BBB";
      "URL" = "https://webinaire.numerique.gouv.fr/welcome";
      "Placement" = "menu";
      "Folder" = "Inria";
    }
  ];
in
  builtins.map addFavicon bookmarks
