{pkgs, lib, ...}: {
  plugins.lazy = {
    enable = lib.mkDefault true;
  };
}
