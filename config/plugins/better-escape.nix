{pkgs, lib, ...}: {
  plugins.better-escape = {
    enable = lib.mkDefault true;
    settings = {
      timeout = lib.mkDefault 200;
    };
  };
}
