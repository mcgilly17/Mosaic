{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.plugs.nui;
in {
  options.plugs.nui.enable = lib.mkEnableOption "nui setup";

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [nui-nvim];
  };
}
