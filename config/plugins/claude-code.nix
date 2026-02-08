{
  pkgs,
  lib,
  ...
}: {
  # snacks.nvim is required for claudecode terminal support
  plugins.snacks = {
    enable = lib.mkDefault true;
  };

  # Use coder/claudecode.nvim directly (not the nixvim module which uses a different plugin)
  # Lazy load on ClaudeCode command to avoid startup errors in sandbox
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.claudecode-nvim;
      optional = true;
    }
  ];

  extraConfigLua = ''
    -- Lazy load claudecode on first command
    vim.api.nvim_create_user_command("ClaudeCode", function()
      require("lz.n").trigger_load("claudecode.nvim")
      require("claudecode").setup({
        terminal = {
          split_side = "right",
          split_width_percentage = 0.4,
          provider = "snacks",
        },
      })
      vim.cmd("ClaudeCode")
    end, {})
  '';

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>ac";
      __unkeyed-2 = "<cmd>ClaudeCode<cr>";
      desc = "Toggle Claude Code";
      icon = "󰚩";
    }
    {
      __unkeyed-1 = "<leader>af";
      __unkeyed-2 = "<cmd>ClaudeCodeFocus<cr>";
      desc = "Focus Claude Code";
      icon = "󰚩";
    }
    {
      __unkeyed-1 = "<leader>as";
      __unkeyed-2 = "<cmd>ClaudeCodeSend<cr>";
      mode = "v";
      desc = "Send to Claude";
      icon = "󰚩";
    }
    {
      __unkeyed-1 = "<leader>aY";
      __unkeyed-2 = "<cmd>ClaudeCodeDiffAccept<cr>";
      desc = "Accept Claude diff";
      icon = "󰄬";
    }
    {
      __unkeyed-1 = "<leader>aN";
      __unkeyed-2 = "<cmd>ClaudeCodeDiffDeny<cr>";
      desc = "Deny Claude diff";
      icon = "󰜺";
    }
  ];
}
