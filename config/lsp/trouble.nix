{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.trouble = {
    enable = lib.mkDefault true;
    settings = {
      auto_close = lib.mkDefault true;
    };
  };

  plugins.which-key.settings.spec = lib.optionals config.plugins.trouble.enable [
    {
      __unkeyed-1 = "<leader>T";
      mode = ["n"];
      group = "+quickfix/trouble";
    }
  ];

  keymaps = lib.mkIf config.plugins.trouble.enable [
    (myLibs.mkNmap "<leader>Tx" "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" "Document Diagnostics (Trouble)")
    (myLibs.mkNmap "<leader>TX" "<cmd>Trouble diagnostics toggle<cr>" "Workspace Diagnostics (Trouble)")
    (myLibs.mkNmap "<leader>Tt" "<cmd>Trouble todo toggle<cr>" "Todo (Trouble)")
    (myLibs.mkNmap "<leader>Tq" "<cmd>Trouble qflist toggle<cr>" "Quickfix List (Trouble)")
  ];
}
