{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = pkgs.lib.mkDefault true;
      capabilities = "offsetEncoding =  'utf-16'";
      servers = {
        bashls.enable = pkgs.lib.mkDefault true;
        dockerls.enable = pkgs.lib.mkDefault true;
        jsonls.enable = pkgs.lib.mkDefault true;
        pyright.enable = pkgs.lib.mkDefault true;
        tailwindcss.enable = pkgs.lib.mkDefault true;
        cssls.enable = pkgs.lib.mkDefault true;
        html.enable = pkgs.lib.mkDefault true;
        htmx.enable = pkgs.lib.mkDefault true;
        yamlls.enable = pkgs.lib.mkDefault true;
        lua-ls = {
          enable = pkgs.lib.mkDefault true;
          settings = {
            Lua = {
              completion = {
                enable = true;
                callSnippet = "Replace";
              };
              hint = {enable = true;};
            };
          };
        };
        marksman.enable = pkgs.lib.mkDefault true;
        nil-ls.enable = pkgs.lib.mkDefault true;
        eslint.enable = pkgs.lib.mkDefault true;
        emmet-ls.enable = pkgs.lib.mkDefault true;
        ruff-lsp.enable = pkgs.lib.mkDefault true;
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
