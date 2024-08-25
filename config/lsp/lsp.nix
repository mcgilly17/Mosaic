{pkgs, ...}: {
  plugins = {
    lsp-format = {
      enable = pkgs.lib.mkDefault false; # Enable it if you want lsp-format integration for none-ls
    };
    lsp = {
      enable = pkgs.lib.mkDefault true;
      capabilities = "offsetEncoding =  'utf-16'";
      servers = {
        lua-ls = {
          enable = pkgs.lib.mkDefault true;
          extraOptions = {
            settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace";
                };
                telemetry = {
                  enabled = false;
                };
                hint = {enable = true;};
              };
            };
          };
        };
        marksman = {
          enable = pkgs.lib.mkDefault true;
        };
        nil-ls = {enable = pkgs.lib.mkDefault true;};
        eslint = {enable = pkgs.lib.mkDefault true;};
        emmet-ls = {enable = true;};
        ruff-lsp = {enable = pkgs.lib.mkDefault true;};
        rust-analyzer = {
          enable = pkgs.lib.mkDefault true;
          installCargo = true;
          installRustc = true;
          settings = {
            checkOnSave = true;
            check = {
              command = "clippy";
            };
            # inlayHints = {
            #   enable = true;
            #   showParameterNames = true;
            #   parameterHintsPrefix = "<- ";
            #   otherHintsPrefix = "=> ";
            # };
            procMacro = {
              enable = true;
            };
          };
        };
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
