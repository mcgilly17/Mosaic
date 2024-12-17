{pkgs, ...}: {
  plugins.colorizer = {
    enable = pkgs.lib.mkDefault true;
  };
}
