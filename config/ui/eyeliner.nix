{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.plugs.eyeliner;
in {
  options.plugs.eyeliner.enable = lib.mkEnableOption "eyeliner setup";

  config = lib.mkIf cfg.enable {
    extraConfigLua = ''
      vim.api.nvim_set_hl(0, 'EyelinerPrimary',   { bold = true, underline = true })
      vim.api.nvim_set_hl(0, 'EyelinerSecondary', { bold = true })
      require("eyeliner").setup({
        -- show highlights only after keypress
        highlight_on_key = true,
      })
    '';
    extraPlugins = with pkgs.vimPlugins; [
      eyeliner-nvim
    ];
  };
}
