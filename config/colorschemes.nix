{pkgs, lib, ...}: {
  colorschemes = {
    catppuccin = {
      enable = lib.mkDefault true;
      settings = {
        background = {
          light = "macchiato";
          dark = "mocha";
        };
        flavour = "mocha";
        term_colors = true;
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
          flash = true;
          grug_far = true;
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
