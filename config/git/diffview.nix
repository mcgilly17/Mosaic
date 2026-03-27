{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.diffview = {
    enable = lib.mkDefault true;
    lazyLoad.settings.cmd = ["DiffviewOpen" "DiffviewFileHistory"];
    settings = {
      keymaps = {
        view = [
          {
            mode = "n";
            key = "<Esc>";
            action.__raw = ''function() vim.cmd("DiffviewClose") end'';
            description = "Close Diffview";
          }
        ];
        file_panel = [
          {
            mode = "n";
            key = "<Esc>";
            action.__raw = ''function() vim.cmd("DiffviewClose") end'';
            description = "Close Diffview";
          }
        ];
        file_history_panel = [
          {
            mode = "n";
            key = "<Esc>";
            action.__raw = ''function() vim.cmd("DiffviewClose") end'';
            description = "Close Diffview";
          }
        ];
      };
    };
  };

  keymaps = lib.mkIf config.plugins.diffview.enable [
    (myLibs.mkNmap "<leader>gd" ":DiffviewOpen<CR>" "Diff View")
    (myLibs.mkNmap "<leader>gf" ":DiffviewFileHistory %<CR>" "File History")
  ];
}
