{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.typescript-tools = {
    enable = lib.mkDefault false;
    settings = {
      tsserverFilePreferences = {
        # Inlay Hints
        includeInlayParameterNameHints = lib.mkDefault "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = lib.mkDefault true;
        includeInlayFunctionParameterTypeHints = lib.mkDefault true;
        includeInlayVariableTypeHints = lib.mkDefault true;
        includeInlayVariableTypeHintsWhenTypeMatchesName = lib.mkDefault true;
        includeInlayPropertyDeclarationTypeHints = lib.mkDefault true;
        includeInlayFunctionLikeReturnTypeHints = lib.mkDefault true;
        includeInlayEnumMemberValueHints = lib.mkDefault true;
      };
    };
  };

  keymaps = lib.mkIf config.plugins.typescript-tools.enable [
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
