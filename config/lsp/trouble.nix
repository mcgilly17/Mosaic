{
  pkgs,
  config,
  ...
}: {
  plugins.trouble = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      auto_close = pkgs.lib.mkDefault true;
    };
  };

  plugins.which-key.settings.spec = pkgs.lib.optionals config.plugins.trouble.enable [
    {
      __unkeyed-1 = "<leader>T";
      mode = [
        "n"
      ];
      group = "+trouble";
    }
  ];

  keymaps = pkgs.lib.mkIf config.plugins.trouble.enable [
    /*
    =============================================
    =                    Trouble                =
    =============================================
    */
    {
      mode = "n";
      key = "<leaderT";
      action = "+diagnostics/quickfix";
    }
    {
      mode = "n";
      key = "<leader>Tx";
      action = "<cmd>TroubleToggle<cr>";
      options = {
        silent = true;
        desc = "Document Diagnostics (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>TX";
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
      options = {
        silent = true;
        desc = "Workspace Diagnostics (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>Tt";
      action = "<cmd>TroubleToggle todo<cr>";
      options = {
        silent = true;
        desc = "Todo (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>TQ";
      action = "<cmd>TodoQuickFix<cr>";
      options = {
        silent = true;
        desc = "Quickfix List (Trouble)";
      };
    }
  ];
}
