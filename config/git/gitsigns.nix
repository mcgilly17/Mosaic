{pkgs, ...}: {
  plugins.gitsigns = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      trouble = true;
      current_line_blame = false;
    };
  };
}
