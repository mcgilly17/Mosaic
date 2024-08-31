{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.plugins.nui;
in {
  options.plugins.nui.enable = lib.mkEnableOption "nui setup";

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [nui-nvim];
  };
}
