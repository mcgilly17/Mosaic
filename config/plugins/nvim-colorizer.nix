{pkgs, ...}: {
  plugins.nvim-colorizer = {
    enable = pkgs.lib.mkDefault true;
  };
}
