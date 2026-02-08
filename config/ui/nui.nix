{pkgs, lib, ...}: {
  plugins.nui = {
    enable = lib.mkDefault true;
  };
}
