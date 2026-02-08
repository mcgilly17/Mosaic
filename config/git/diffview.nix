{pkgs, lib, ...}: {
  plugins.diffview = {
    enable = lib.mkDefault true;
  };
}
