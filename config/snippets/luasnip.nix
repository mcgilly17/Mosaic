{pkgs, ...}: {
  plugins.luasnip = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = [
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
