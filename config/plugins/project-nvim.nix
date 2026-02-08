{pkgs, lib, ...}: {
  plugins.project-nvim = {
    enable = lib.mkDefault true;
    enableTelescope = lib.mkDefault true;
    lazyLoad.settings.cmd = "Telescope projects";
  };
}
