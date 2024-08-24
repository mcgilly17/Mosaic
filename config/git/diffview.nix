{pkgs, ...}: {
  plugins.diffview = {
    enable = pkgs.lib.mkDefault true;
  };
}
