{pkgs, ...}: {
  plugins.lspkind = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      symbol_map = {};
      maxwidth = pkgs.lib.mkDefault 50;
      ellipsis_char = pkgs.lib.mkDefault "...";
    };
  };
}
