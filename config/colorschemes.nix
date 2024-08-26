{pkgs, ...}: {
  colorschemes = {
    catppuccin = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };
        flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
        term_colors = true;
        disable_bold = false;
        disable_italic = false;
        disable_underline = false;
        transparent_background = false;
        integrations = {
          cmp = true;
          harpoon = true;
          headlines = true;
          gitsigns = true;
          illuminate = {
            enabled = true;
          };
          indent_blankline = {
            enabled = true;
            colored_indent_levels = true;
          };
          mini.enabled = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              information = ["underline"];
              warnings = ["underline"];
            };
          };
          noice = true;
          notify = true;
          neotree = true;
          nvim_surround = true;
          treesitter = true;
          treesitter_context = true;
          telescope.enabled = true;
          which_key = true;
        };
      };
    };
  };
}
