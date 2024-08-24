{pkgs, ...}: {
  plugins.trouble = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      auto_close = true;
    };
  };
}
