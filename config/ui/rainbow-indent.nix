{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.plugins.rainbow-indent;
in {
  # Make rainbow indent optional, as well as rainbow delimiters
  options.plugins.rainbow-indent.enable = lib.mkEnableOption "rainbow Indents";

  config = lib.mkIf cfg.enable {
    # install rainbow delimiters
    plugins.rainbow-delimiters.enable = lib.mkDefault true;
    #install rainbow-indent, a plugin that will recreate the vscode like indents
    extraPlugins = with pkgs; [
      (vimUtils.buildVimPlugin {
        pname = "indent-rainbowline.nvim";
        version = "0.1.0";
        src = fetchFromGitHub {
          owner = "TheGLander";
          repo = "indent-rainbowline.nvim";
          rev = "572e8157de85d7af3f0085b5c74c059518900649";
          sha256 = "sha256-dSXNtbyPY5ZWT/RCYsmy/swgErJm7zSfaDd5J+15wYc=";
        };
      })
    ];

    extraConfigLuaPost = ''
      local highlight = {
        "RainbowRed",
        "RainbowViolet",
        "RainbowCyan",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba6f7" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#94e2d5" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup(require("indent-rainbowline").make_opts(opts))

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    '';
  };
}
