{pkgs, lib, ...}: {
  plugins.ts-autotag = {
    enable = lib.mkDefault true;
  };
}
