{pkgs, ...}: {
  plugins.better-escape = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      timeout = 200;
    };
  };
}
