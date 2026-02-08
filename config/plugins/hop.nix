{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.hop = {
    enable = lib.mkDefault true;
  };

  plugins.which-key.settings.spec = lib.optionals config.plugins.hop.enable [
    {
      __unkeyed-1 = "<leader>j";
      mode = ["n"];
      group = "+jump";
      icon = "󰦻";
    }
  ];

  keymaps = lib.mkIf config.plugins.hop.enable [
    (myLibs.mkNmap "<leader>jw" ":HopWord<CR>" "Jump to Word")
    (myLibs.mkNmap "<leader>ja" ":HopAnywhere<CR>" "Jump to Anywhere")
    (myLibs.mkNmap "<leader>jl" ":HopLineStart<CR>" "Jump to Line")
    (myLibs.mkNmap "<leader>jp" ":HopPattern<CR>" "Jump to Pattern")
    (myLibs.mkNmap "<leader>jv" ":HopVertical<CR>" "Jump Vertically")
    (myLibs.mkNmap "<leader>jn" ":HopNode<CR>" "Jump to Node")
    (myLibs.mkNmap "<leader>jy" ":HopYankChar1<CR>" "Yank without Jumping")

    # Remapping f/F and t/T to use Hop
    (myLibs.mkRawmap ["n"] "f" ''
      function()
        require'hop'.hint_char1({
          direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = 1
        })
      end
    '' "Hop forward to char")
    (myLibs.mkRawmap ["n"] "F" ''
      function()
        require'hop'.hint_char1({
          direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1
        })
      end
    '' "Hop backward to char")
    (myLibs.mkRawmap ["n"] "t" ''
      function()
        require'hop'.hint_char1({
          direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1
        })
      end
    '' "Hop forward before char")
    (myLibs.mkRawmap ["n"] "T" ''
      function()
        require'hop'.hint_char1({
          direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = -1
        })
      end
    '' "Hop backward before char")
  ];
}
