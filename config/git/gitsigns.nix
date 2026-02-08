{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.gitsigns = {
    enable = lib.mkDefault true;
    lazyLoad.settings.event = "BufReadPre";
    settings = {
      trouble = lib.mkDefault true;
      current_line_blame = lib.mkDefault false;
    };
  };

  keymaps = lib.mkIf config.plugins.gitsigns.enable [
    (myLibs.mkNVmap "<leader>gh" ":Gitsigns<CR>" "+hunks")
    (myLibs.mkNmap "<leader>ghb" ":Gitsigns blame_line<CR>" "Blame line")
    (myLibs.mkNmap "<leader>ghd" ":Gitsigns diffthis<CR>" "Diff This")
    (myLibs.mkNmap "<leader>ghp" ":Gitsigns preview_hunk<CR>" "Preview hunk")
    (myLibs.mkNmap "<leader>ghR" ":Gitsigns reset_buffer<CR>" "Reset Buffer")
    (myLibs.mkNVmap "<leader>ghr" ":Gitsigns reset_hunk<CR>" "Reset Hunk")
    (myLibs.mkNVmap "<leader>ghs" ":Gitsigns stage_hunk<CR>" "Stage Hunk")
    (myLibs.mkNmap "<leader>ghS" ":Gitsigns stage_buffer<CR>" "Stage Buffer")
    (myLibs.mkNmap "<leader>ghu" ":Gitsigns undo_stage_hunk<CR>" "Undo Stage Hunk")
  ];
}
