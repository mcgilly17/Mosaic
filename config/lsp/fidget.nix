{pkgs, lib, ...}: {
  plugins.fidget = {
    enable = lib.mkDefault true;
    settings = {
      logger = lib.mkDefault {
        level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
        float_precision = 0.01; # Limit the number of decimals displayed for floats
      };
      progress = lib.mkDefault {
        suppress_on_insert = true; # Suppress new messages while in insert mode
      };
      notification = lib.mkDefault {
        override_vim_notify = true;

        window = {
          winblend = 0;
          border = "none"; # none, single, double, rounded, solid, shadow
        };
      };
    };
  };
}
