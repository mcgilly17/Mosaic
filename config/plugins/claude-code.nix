{
  pkgs,
  lib,
  ...
}: let
  enable = true;
in
  lib.mkIf enable {
    plugins.snacks = {
      enable = lib.mkDefault true;
    };

    extraPlugins = [
      {
        plugin = pkgs.vimPlugins.claudecode-nvim;
        optional = true;
      }
    ];

    extraConfigLua = ''
      vim.api.nvim_create_user_command("ClaudeCode", function()
        vim.cmd("packadd claudecode.nvim")
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
        __unkeyed-1 = "<leader>ay";
        __unkeyed-2 = "<cmd>ClaudeCodeDiffAccept<cr>";
        desc = "Accept Claude diff";
        icon = "󰄬";
      }
      {
        __unkeyed-1 = "<leader>an";
        __unkeyed-2 = "<cmd>ClaudeCodeDiffDeny<cr>";
        desc = "Deny Claude diff";
        icon = "󰜺";
      }
    ];
  }
