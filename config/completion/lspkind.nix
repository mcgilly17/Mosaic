{pkgs, ...}: {
  plugins.lspkind = {
    enable = pkgs.lib.mkDefault true;
    symbolMap = {};
    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
