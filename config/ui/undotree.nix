{pkgs, ...}: {
  plugins.undotree = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      autoOpenDiff = true;
      focusOnToggle = true;
    };
  };
}
