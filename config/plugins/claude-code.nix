{
  pkgs,
  ...
}: {
  # snacks.nvim is required for claudecode terminal support
  plugins.snacks = {
    enable = pkgs.lib.mkDefault true;
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
      __unkeyed-1 = "<leader>cc";
      __unkeyed-2 = "<cmd>ClaudeCode<cr>";
      desc = "Toggle Claude Code";
      icon = "󰚩";
    }
    {
      __unkeyed-1 = "<leader>cf";
      __unkeyed-2 = "<cmd>ClaudeCodeFocus<cr>";
      desc = "Focus Claude Code";
      icon = "󰚩";
    }
    {
      __unkeyed-1 = "<leader>cs";
      __unkeyed-2 = "<cmd>ClaudeCodeSend<cr>";
      mode = "v";
      desc = "Send to Claude";
      icon = "󰚩";
    }
  ];
}
