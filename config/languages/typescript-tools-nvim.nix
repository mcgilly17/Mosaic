{pkgs, ...}: {
  plugins.typescript-tools = {
    enable = pkgs.lib.mkDefault true;
    onAttach = pkgs.lib.mkDefault ''
      function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    '';
    settings = pkgs.lib.mkDefault {
      tsserverFilePreferences = {
        # Inlay Hints
        includeInlayParameterNameHints = "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = true;
        includeInlayFunctionParameterTypeHints = true;
        includeInlayVariableTypeHints = true;
        includeInlayVariableTypeHintsWhenTypeMatchesName = true;
        includeInlayPropertyDeclarationTypeHints = true;
        includeInlayFunctionLikeReturnTypeHints = true;
        includeInlayEnumMemberValueHints = true;
      };
    };
  };
}
