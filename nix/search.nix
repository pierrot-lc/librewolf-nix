{
  version = 10;
  engines = [
    {
      id = "google";
      _name = "Google";
      _isAppProvided = true;
      _metaData = {};
    }
    {
      id = "ddg";
      _name = "DuckDuckGo";
      _isAppProvided = true;
      _metaData = {};
    }
  ];
  metaData = {
    useSavedOrder = false;
    locale = "en-US";
    region = "unknown";
    channel = "default";
    experiment = "";
    distroID = "nixos";
    appDefaultEngineId = "google";
  };
}
