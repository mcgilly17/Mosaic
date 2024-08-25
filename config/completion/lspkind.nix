{pkgs, ...}: {
  plugins.lspkind = {
    enable = pkgs.lib.mkDefault true;
    symbolMap = {};
    extraOptions = pkgs.lib.mkDefault {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
