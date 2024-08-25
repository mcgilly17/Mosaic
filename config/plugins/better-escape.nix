{pkgs, ...}: {
  plugins.better-escape = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      timeout = 200;
    };
  };
}
