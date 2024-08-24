{pkgs, ...}: {
  plugins.wilder = {
    enable = pkgs.lib.mkDefault true;
    modes = [":" "/" "?"];
  };
}
