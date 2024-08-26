{pkgs, ...}: {
  plugins.hop = {
    enable = pkgs.lib.mkDefault true;
  };
}
