{pkgs, lib, ...}: {
  plugins.diffview = {
    enable = lib.mkDefault true;
    lazyLoad.settings.cmd = "DiffviewOpen";
  };
}
