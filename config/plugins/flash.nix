{
  config,
  lib,
  myLibs,
  ...
}: {
  plugins.flash = {
    enable = lib.mkDefault true;
    settings = {
      modes = {
        char = {
          jump_labels = true;
        };
      };
      label = {
        uppercase = false;
      };
      search = {
        exclude = [
          "notify"
          "cmp_menu"
          "noice"
          "flash_prompt"
          {
            __raw = ''
              function(win)
                return not vim.api.nvim_win_get_config(win).focusable
              end
            '';
          }
        ];
      };
    };
  };

  plugins.which-key.settings.spec = lib.optionals config.plugins.flash.enable [
    {
      __unkeyed-1 = "<leader>j";
      mode = ["n"];
      group = "+jump";
      icon = "󰦻";
    }
  ];

  keymaps = lib.mkIf config.plugins.flash.enable [
    (myLibs.mkRawmap ["n" "x" "o"] "<leader>jj" ''
      function()
        require("flash").jump()
      end
    '' "Jump to Char")
    (myLibs.mkRawmap ["n" "x" "o"] "<leader>jt" ''
      function()
        require("flash").treesitter()
      end
    '' "Jump to Treesitter Node")
    (myLibs.mkRawmap ["n" "x" "o"] "<leader>jl" ''
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^",
        })
      end
    '' "Jump to Line")
    (myLibs.mkRawmap ["o"] "<leader>jr" ''
      function()
        require("flash").remote()
      end
    '' "Remote Flash")
    (myLibs.mkRawmap ["o" "x"] "<leader>js" ''
      function()
        require("flash").treesitter_search()
      end
    '' "Treesitter Search")
  ];
}
