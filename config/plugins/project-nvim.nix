{pkgs, ...}: {
  plugins.project-nvim = {
    enable = pkgs.lib.mkDefault true;
    enableTelescope = pkgs.lib.mkDefault true;
  };
}
