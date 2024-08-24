{pkgs, ...}: {
  plugins.lazy = {
    enable = pkgs.lib.mkDefault true;
  };
}
