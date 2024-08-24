{pkgs, ...}: {
  plugins.persistence = {
    enable = pkgs.lib.mkDefault true;
  };
}
