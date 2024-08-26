{pkgs, ...}: {
  plugins.undotree = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      autoOpenDiff = pkgs.lib.mkDefault true;
      focusOnToggle = pkgs.lib.mkDefault true;
    };
  };
}
