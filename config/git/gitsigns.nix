{pkgs, ...}: {
  plugins.gitsigns = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      trouble = true;
      current_line_blame = false;
    };
  };
}
