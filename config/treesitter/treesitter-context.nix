{pkgs, lib, ...}: {
  plugins.treesitter-context = {
    enable = lib.mkDefault true;
  };
}
