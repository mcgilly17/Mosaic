{pkgs, ...}: {
  plugins.typescript-tools = {
    enable = pkgs.lib.mkDefault true;
    onAttach = ''
      function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    '';
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
}
