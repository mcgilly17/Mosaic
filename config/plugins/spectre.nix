{pkgs, ...}: {
  plugins.spectre = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      replace = "sed";
    };
  };
}
