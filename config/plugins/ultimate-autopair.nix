{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.plugins.ultimate-autopair;
in {
  options.plugins.ultimate-autopair.enable = lib.mkEnableOption "ultimate-autopair setup";

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimUtils; [
      (buildVimPlugin {
        pname = "ultimate-autopair.nvim";
        version = "2026-03-14";
        src = pkgs.fetchFromGitHub {
          owner = "altermo";
          repo = "ultimate-autopair.nvim";
          rev = "6b58234de921437836efe27714b2026ed2ee235a";
          sha256 = "18zfjw4s2w0pyarqj9275ilw4askycpflcs8vwypw5hkgdmglhi4";
        };
      })
    ];
    extraConfigLua = ''
      require('ultimate-autopair').setup()
    '';
  };
}
