{pkgs, lib, ...}: {
  plugins.colorizer = {
    enable = lib.mkDefault true;
  };
}
