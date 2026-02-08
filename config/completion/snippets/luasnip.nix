{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.luasnip = {
    enable = lib.mkDefault true;
    settings = lib.mkDefault {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = lib.mkDefault [
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
}
