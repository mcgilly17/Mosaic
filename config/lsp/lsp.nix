{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins = {
    lsp-format.enable = lib.mkIf (!config.plugins.conform-nvim.enable) true;
    lsp = {
      enable = lib.mkDefault true;
      capabilities = "offsetEncoding = 'utf-16'";
      servers = {
        bashls.enable = lib.mkDefault true;
        dockerls.enable = lib.mkDefault true;
        jsonls.enable = lib.mkDefault true;
        prismals.enable = lib.mkDefault true;
        prismals.package = null;
        graphql.enable = lib.mkDefault false;
        pyright.enable = lib.mkDefault true;
        tailwindcss = {
          enable = lib.mkDefault true;
          filetypes = ["html" "vue" "typescriptreact" "javascriptreact"];
        };
        cssls.enable = lib.mkDefault true;
        html.enable = lib.mkDefault true;
        htmx.enable = lib.mkDefault true;
        yamlls.enable = lib.mkDefault true;
        lua_ls = {
          enable = lib.mkDefault true;
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
        marksman.enable = lib.mkDefault false; # TODO: re-enable when Swift builds on macOS
        ts_ls = {
          enable = lib.mkDefault true;
          autostart = true;
          filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
          ];
          extraOptions = {
            settings = {
              javascript = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true;
                  includeInlayFunctionLikeReturnTypeHints = true;
                  includeInlayFunctionParameterTypeHints = true;
                  includeInlayParameterNameHints = "all";
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                  includeInlayPropertyDeclarationTypeHints = true;
                  includeInlayVariableTypeHints = true;
                  includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                };
              };
              typescript = {
                inlayHints = {
                  includeInlayEnumMemberValueHints = true;
                  includeInlayFunctionLikeReturnTypeHints = true;
                  includeInlayFunctionParameterTypeHints = true;
                  includeInlayParameterNameHints = "all";
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                  includeInlayPropertyDeclarationTypeHints = true;
                  includeInlayVariableTypeHints = true;
                  includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                };
              };
            };
          };
        };
        nil_ls.enable = lib.mkDefault true;
        nixd.enable = lib.mkDefault true;
        eslint.enable = lib.mkDefault true;
        emmet_ls.enable = lib.mkDefault true;
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          ga = {
            action = "type_definition";
            desc = "Type Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          H = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>lw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>la" = {
            action = "code_action";
            desc = "Code Action";
          };
          "<leader>ls" = {
            action = "signature_help";
            desc = "Signature Help";
          };
        };
        diagnostic = {
          "<leader>ld" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = lib.mkIf config.plugins.lsp.enable ''
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

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';

  plugins.which-key.settings.spec = lib.optionals config.plugins.lsp.enable [
    {
      __unkeyed-1 = "<leader>l";
      mode = [
        "n"
        "v"
      ];
      group = "+LSP";
      icon = "󰬓";
    }
  ];
}
