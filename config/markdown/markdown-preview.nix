{pkgs, ...}: {
  plugins.markdown-preview = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      theme = pkgs.lib.mkDefault "dark";
    };
  };
}
