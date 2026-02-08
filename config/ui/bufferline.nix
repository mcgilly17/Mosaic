{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins = {
    bufferline = {
      enable = lib.mkDefault true;
      settings.options = {
        separator_style = lib.mkDefault "slant"; # "slant", "padded_slant", "slope", "padded_slope", "thick", "thin"
        offsets = lib.mkDefault [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };

  keymaps = lib.mkIf config.plugins.bufferline.enable [
    (myLibs.mkNmap "<Tab>" "<cmd>BufferLineCycleNext<cr>" "Cycle to next buffer")
    (myLibs.mkNmap "<S-Tab>" "<cmd>BufferLineCyclePrev<cr>" "Cycle to previous buffer")
    (myLibs.mkNmap "<leader>br" "<cmd>BufferLineCloseRight<cr>" "Delete buffers to the right")
    (myLibs.mkNmap "<leader>bl" "<cmd>BufferLineCloseLeft<cr>" "Delete buffers to the left")
    (myLibs.mkNmap "<leader>bo" "<cmd>BufferLineCloseOthers<cr>" "Delete other buffers")
    (myLibs.mkNmap "<leader>bp" "<cmd>BufferLineTogglePin<cr>" "Toggle pin")
    (myLibs.mkNmap "<leader>bP" "<Cmd>BufferLineGroupClose ungrouped<CR>" "Delete non-pinned buffers")
  ];
}
