{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.avante = {
    enable = lib.mkDefault true;
    settings = {
      provider = "openai";
    };
  };
  plugins.which-key.settings.spec = lib.optionals config.plugins.avante.enable [
    {
      __unkeyed-1 = "<leader>a";
      mode = [
        "n"
        "v"
      ];
      group = "AI";
      icon = "";
    }
  ];
}
