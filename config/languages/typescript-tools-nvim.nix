{
  pkgs,
  config,
  ...
}: {
  plugins.typescript-tools = {
    enable = pkgs.lib.mkDefault false;
    settings = {
      tsserverFilePreferences = {
        # Inlay Hints
        includeInlayParameterNameHints = pkgs.lib.mkDefault "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = pkgs.lib.mkDefault true;
        includeInlayFunctionParameterTypeHints = pkgs.lib.mkDefault true;
        includeInlayVariableTypeHints = pkgs.lib.mkDefault true;
        includeInlayVariableTypeHintsWhenTypeMatchesName = pkgs.lib.mkDefault true;
        includeInlayPropertyDeclarationTypeHints = pkgs.lib.mkDefault true;
        includeInlayFunctionLikeReturnTypeHints = pkgs.lib.mkDefault true;
        includeInlayEnumMemberValueHints = pkgs.lib.mkDefault true;
      };
    };
  };

  keymaps = pkgs.lib.mkIf config.plugins.typescript-tools.enable [
    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>TSToolsOrganizeImports<cr>";
      options = {
        desc = "Organize Imports";
      };
    }
    {
      mode = "n";
      key = "<leader>cR";
      action = "<cmd>TSToolsRemoveUnusedImports<cr>";
      options = {
        desc = "Remove Unused Imports";
      };
    }
  ];
}
