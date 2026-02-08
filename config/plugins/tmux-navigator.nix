{pkgs, lib, ...}: {
  plugins.tmux-navigator = {
    enable = lib.mkDefault true;
  };
}
