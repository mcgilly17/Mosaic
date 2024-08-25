{pkgs, ...}: {
  plugins.trouble = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      auto_close = true;
    };
  };
}
