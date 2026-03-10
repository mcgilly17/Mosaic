{
  config,
  lib,
  myLibs,
  ...
}: {
  plugins.grug-far = {
    enable = lib.mkDefault true;
  };

  plugins.which-key.settings.spec = lib.optionals config.plugins.grug-far.enable [
    {
      __unkeyed-1 = "<leader>r";
      mode = ["n" "x"];
      group = "refactor";
      icon = " ";
    }
  ];

  keymaps = lib.mkIf config.plugins.grug-far.enable [
    (myLibs.mkCmdmap "n" "<leader>rg" "GrugFar" "Search / Replace")
    (myLibs.mkRawmap ["n"] "<leader>rw" ''
      function()
        require("grug-far").open({
          prefills = {
            search = vim.fn.expand("<cword>"),
            paths = vim.fn.expand("%"),
          },
        })
      end
    '' "Replace word in file")
    (myLibs.mkRawmap ["v"] "<leader>rw" ''
      function()
        require("grug-far").with_visual_selection({
          prefills = {
            paths = vim.fn.expand("%"),
          },
        })
      end
    '' "Replace selection in file")
    (myLibs.mkRawmap ["n"] "<leader>rW" ''
      function()
        require("grug-far").open({
          prefills = {
            search = vim.fn.expand("<cword>"),
          },
        })
      end
    '' "Replace word project-wide")
  ];
}
