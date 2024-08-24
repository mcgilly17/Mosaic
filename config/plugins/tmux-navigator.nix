{pkgs, ...}: {
  plugins.tmux-navigator = {
    enable = pkgs.lib.mkDefault true;
  };
}
