{
  pkgs,
  lib,
  config,
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
      mode = [
        "n"
      ];
      group = "+quickfix/trouble";
    }
  ];

  keymaps = lib.mkIf config.plugins.trouble.enable [
    /*
    =============================================
    =                    Trouble                =
    =============================================
    */
    {
      mode = "n";
      key = "<leader>Tx";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options = {
        silent = true;
        desc = "Document Diagnostics (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>TX";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = {
        silent = true;
        desc = "Workspace Diagnostics (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>Tt";
      action = "<cmd>Trouble todo toggle<cr>";
      options = {
        silent = true;
        desc = "Todo (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>Tq";
      action = "<cmd>Trouble qflist toggle<cr>";
      options = {
        silent = true;
        desc = "Quickfix List (Trouble)";
      };
    }
  ];
}
