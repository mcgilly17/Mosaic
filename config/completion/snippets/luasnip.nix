{
  pkgs,
  config,
  ...
}: {
  plugins.luasnip = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = pkgs.lib.mkDefault [
      {
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
      {
        lazyLoad = true;
        paths = ./snippet-library;
      }
    ];
  };

  extraConfigLua = pkgs.lib.mkIf config.plugins.luasnip.enable ''
    luasnip = require("luasnip")
  '';
}
