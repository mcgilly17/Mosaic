{pkgs, lib, ...}: {
  plugins.ts-context-commentstring = {
    enable = lib.mkDefault true;
    disableAutoInitialization = lib.mkDefault false;
  };
}
