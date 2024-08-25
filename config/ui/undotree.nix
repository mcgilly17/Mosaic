{pkgs, ...}: {
  plugins.undotree = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      autoOpenDiff = true;
      focusOnToggle = true;
    };
  };
}
