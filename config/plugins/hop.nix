{
  pkgs,
  config,
  ...
}: {
  plugins.hop = {
    enable = pkgs.lib.mkDefault true;
  };

  plugins.which-key.settings.spec = pkgs.lib.optionals config.plugins.hop.enable [
    {
      __unkeyed-1 = "<leader>j";
      mode = [
        "n"
      ];
      group = "+jump";
      icon = "󰦻";
    }
  ];

  keymaps = pkgs.lib.mkIf config.plugins.hop.enable [
    /*
    =============================================
    =                     Hop                   =
    =============================================
    */

    {
      mode = ["n"];
      key = "<leader>jw";
      action = ":HopWord<CR>";
      options = {
        silent = true;
        desc = "Jump to Word";
      };
    }

    {
      mode = ["n"];
      key = "<leader>ja";
      action = ":HopAnywhere<CR>";
      options = {
        silent = true;
        desc = "Jump to Anywhere";
      };
    }

    {
      mode = ["n"];
      key = "<leader>jl";
      action = ":HopLineStart<CR>";
      options = {
        silent = true;
        desc = "Jump to Line";
      };
    }

    {
      mode = ["n"];
      key = "<leader>jp";
      action = ":HopPattern<CR>";
      options = {
        silent = true;
        desc = "Jump to Pattern";
      };
    }

    {
      mode = ["n"];
      key = "<leader>jv";
      action = ":HopVertical<CR>";
      options = {
        silent = true;
        desc = "Jump Vertically";
      };
    }

    {
      mode = ["n"];
      key = "<leader>jn";
      action = ":HopNode<CR>";
      options = {
        silent = true;
        desc = "Jump to Node";
      };
    }

    {
      mode = ["n"];
      key = "<leader>jy";
      action = ":HopYankChar1<CR>";
      options = {
        silent = true;
        desc = "Yank without Jumping";
      };
    }
    #### remapping f/F and t/T to use Hop
    {
      mode = ["n"];
      key = "f";
      action.__raw = ''
          function()
              require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
              current_line_only = true,
                hint_offset = 1
            })
        end
      '';
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = ["n"];
      key = "F";
      action.__raw = ''
          function()
              require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
              current_line_only = true,
                hint_offset = 1
            })
        end
      '';
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = ["n"];
      key = "t";
      action.__raw = ''
          function()
              require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
              current_line_only = true,
                hint_offset = -1
            })
        end
      '';
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = ["n"];
      key = "T";
      action.__raw = ''
          function()
              require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
              current_line_only = true,
                hint_offset = -1
            })
        end
      '';
      options = {
        noremap = true;
        silent = true;
      };
    }
  ];
}
