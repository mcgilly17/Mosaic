{pkgs, ...}: {
  plugins.nui = {
    enable = pkgs.lib.mkDefault true;
  };
}
