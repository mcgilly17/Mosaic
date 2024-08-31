{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.plugins.stay-centered;
in {
  options.plugins.stay-centered.enable = lib.mkEnableOption "stay-centered setup";

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimUtils; [
      # NOTE: Manual pkg install, check update
      (buildVimPlugin {
        pname = "stay-centered.nvim";
        version = "2024-02-07";
        src = pkgs.fetchFromGitHub {
          owner = "arnamak";
          repo = "stay-centered.nvim";
          rev = "91113bd82ac34f25c53d53e7c1545cb5c022ade8";
          sha256 = "sha256-DDhF/a8S7Z1aR1Hg8UVgttl3je0hhn/OpZoakOeMHQw=";
        };
      })
    ];
    extraConfigLua = lib.mkIf cfg.enable "require('stay-centered').setup({})";
  };
}
