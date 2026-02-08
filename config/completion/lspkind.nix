{pkgs, lib, ...}: {
  plugins.lspkind = {
    enable = lib.mkDefault true;
    settings = {
      symbol_map = {};
      maxwidth = lib.mkDefault 50;
      ellipsis_char = lib.mkDefault "...";
    };
  };
}
