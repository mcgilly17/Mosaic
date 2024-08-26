{pkgs, ...}: {
  plugins.lspkind = {
    enable = pkgs.lib.mkDefault true;
    symbolMap = {};
    extraOptions = {
      maxwidth = pkgs.lib.mkDefault 50;
      ellipsis_char = pkgs.lib.mkDefault "...";
    };
  };
}
