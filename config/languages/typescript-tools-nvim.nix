{
  lib,
  config,
  myLibs,
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
    (myLibs.mkNmap "<leader>co" "<cmd>TSToolsOrganizeImports<cr>" "Organize Imports")
    (myLibs.mkNmap "<leader>cR" "<cmd>TSToolsRemoveUnusedImports<cr>" "Remove Unused Imports")
  ];
}
