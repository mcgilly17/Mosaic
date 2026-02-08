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
  extraPlugins = [
    pkgs.vimPlugins.claudecode-nvim
  ];

  extraConfigLua = ''
    require("claudecode").setup({
      terminal = {
        split_side = "right",
        split_width_percentage = 0.4,
        provider = "snacks",
      },
    })
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
