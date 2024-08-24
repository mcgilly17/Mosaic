{pkgs, ...}: {
  plugins.ts-context-commentstring = {
    enable = pkgs.lib.mkDefault true;
    disableAutoInitialization = false;
  };
}
