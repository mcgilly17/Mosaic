{pkgs, ...}: {
  plugins.avante = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      provider = "openai";
    };
  };
}
