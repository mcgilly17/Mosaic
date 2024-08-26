{pkgs, ...}: {
  plugins.gitsigns = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      trouble = pkgs.lib.mkDefault true;
      current_line_blame = pkgs.lib.mkDefault false;
    };
  };
}
