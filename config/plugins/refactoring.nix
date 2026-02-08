{
  config,
  lib,
  myLibs,
  ...
}: {
  plugins = {
    refactoring = {
      enable = true;
    };

    telescope.enabledExtensions = lib.mkIf config.plugins.telescope.enable ["refactoring"];

    which-key.settings.spec = lib.optionals config.plugins.refactoring.enable [
      {
        __unkeyed-1 = "<leader>r";
        mode = ["n" "x"];
        group = "refactor";
        icon = " ";
      }
    ];
  };

  keymaps =
    lib.optionals config.plugins.refactoring.enable [
      (myLibs.mkXmap "<leader>re" ":Refactor extract " "Extract")
      (myLibs.mkXmap "<leader>rE" ":Refactor extract_to_file " "Extract to file")
      (myLibs.mkXmap "<leader>rv" ":Refactor extract_var " "Extract var")
      (myLibs.mkNmap "<leader>ri" ":Refactor inline_var<CR>" "Inline var")
      (myLibs.mkNmap "<leader>rI" ":Refactor inline_func<CR>" "Inline Func")
      (myLibs.mkNmap "<leader>rb" ":Refactor extract_block<CR>" "Extract block")
      (myLibs.mkNmap "<leader>rB" ":Refactor extract_block_to_file<CR>" "Extract block to file")
    ]
    ++ lib.optionals config.plugins.telescope.enable [
      (myLibs.mkRawmap "n" "<leader>fR" ''
        function()
          require('telescope').extensions.refactoring.refactors()
        end
      '' "Refactoring")
    ];
}
