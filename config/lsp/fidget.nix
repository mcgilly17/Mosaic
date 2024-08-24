{pkgs, ...}: {
  plugins.fidget = {
    enable = pkgs.lib.mkDefault true;
    logger = {
      level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
      floatPrecision = 0.01; # Limit the number of decimals displayed for floats
    };
    progress = {
      suppressOnInsert = true; # Suppress new messages while in insert mode
    };
    notification = {
      overrideVimNotify = true;

      window = {
        winblend = 0;
        border = "none"; # none, single, double, rounded, solid, shadow
      };
    };
  };
}
