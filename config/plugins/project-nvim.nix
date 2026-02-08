{pkgs, lib, ...}: {
  plugins.project-nvim = {
    enable = lib.mkDefault true;
    enableTelescope = lib.mkDefault true;
    # Load on UIEnter so the telescope extension is registered
    # before user tries "Telescope projects"
    lazyLoad.settings.event = "UIEnter";
  };
}
