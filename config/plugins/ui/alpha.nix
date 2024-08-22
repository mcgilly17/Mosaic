{
  plugins.alpha = {
    enable = true;
    theme = null;
    iconsEnabled = true;
    layout = let
      padding = val: {
        type = "padding";
        inherit val;
      };
    in [
      (padding 4)
      {
        opts = {
          hl = "AlphaHeader";
          position = "center";
        };
        type = "text";
        val = [
          "                git@github.com:mcgilly17             "
          "                                                     "
          "   ███▄ ▄███▓▄████▄   ▄████ ██▓██▓    ██▓  ▓██   ██▓ "
          "  ▓██▒▀█▀ ██▒██▀ ▀█  ██▒ ▀█▓██▓██▒   ▓██▒   ▒██  ██▒ "
          "  ▓██    ▓██▒▓█    ▄▒██░▄▄▄▒██▒██░   ▒██░    ▒██ ██░ "
          "  ▒██    ▒██▒▓▓▄ ▄██░▓█  ██░██▒██░   ▒██░    ░ ▐██▓░ "
          "  ▒██▒   ░██▒ ▓███▀ ░▒▓███▀░██░██████░██████▒░ ██▒▓░ "
          "  ░ ▒░   ░  ░ ░▒ ▒  ░░▒   ▒░▓ ░ ▒░▓  ░ ▒░▓  ░ ██▒▒▒  "
          "  ░  ░      ░ ░  ▒    ░   ░ ▒ ░ ░ ▒  ░ ░ ▒  ▓██ ░▒░  "
          "  ░      ░  ░       ░ ░   ░ ▒ ░ ░ ░    ░ ░  ▒ ▒ ░░   "
          "         ░  ░ ░           ░ ░     ░  ░   ░  ░ ░      "
          "            ░                               ░ ░      "
        ];
      }
      (padding 2)
      {
        type = "button";
        val = "  Find File";
        on_press = {
          __raw = "function() require('telescope.builtin').find_files() end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "f"
            ":Telescope find_files <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "f";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "  New File";
        on_press = {
          __raw = "function() vim.cmd[[ene]] end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "n"
            ":ene <BAR> startinsert <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "n";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "󰈚  Recent Files";
        on_press = {
          __raw = "function() require('telescope.builtin').oldfiles() end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "r"
            ":Telescope oldfiles <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "r";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "󰈭  Find Word";
        on_press = {
          __raw = "function() require('telescope.builtin').live_grep() end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "g"
            ":Telescope live_grep <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "g";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "  Restore Session";
        on_press = {
          __raw = "function() require('persistence').load() end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "s"
            ":lua require('persistence').load()<cr>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "s";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "  Quit Neovim";
        on_press = {
          __raw = "function() vim.cmd[[qa]] end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "q"
            ":qa<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "q";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
    ];
  };
}
