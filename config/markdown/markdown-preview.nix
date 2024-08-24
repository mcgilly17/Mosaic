{pkgs, ...}: {
  plugins.markdown-preview = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      theme = "dark";
    };
  };
}
