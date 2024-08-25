{pkgs, ...}: {
  plugins.markdown-preview = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      theme = "dark";
    };
  };
}
