{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins = {
    lsp = {
      enable = pkgs.lib.mkDefault true;
      capabilities = "offsetEncoding = 'utf-16'";
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
        lua_ls = {
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
        nil_ls.enable = pkgs.lib.mkDefault true;
        nixd.enable = pkgs.lib.mkDefault true;
        eslint.enable = pkgs.lib.mkDefault true;
        emmet_ls.enable = pkgs.lib.mkDefault true;
        ruff_lsp.enable = pkgs.lib.mkDefault true;
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

    vim.diagnostic.config{
      float={border=_border}
    };

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

  keymaps = lib.mkIf config.plugins.lsp.enable [
    /*
    =============================================
    =                LSP Keymaps                =
    =============================================
    */

    {
      mode = "n";
      key = "<leader>la";
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        desc = "Code Action";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd>Lspsaga peek_type_definition<CR>";
      options = {
        desc = "Type Definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lD";
      action = "<cmd>Lspsaga finder def<CR>";
      options = {
        desc = "Goto Definition";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>lh";
      action = "<cmd>Lspsaga hover_doc<CR>";
      options = {
        desc = "Hover";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lI";
      action = "<cmd>Lspsaga finder imp<CR>";
      options = {
        desc = "Goto Implementation";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ll";
      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = {
        desc = "Line Diagnostics";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>lo";
      action = "<cmd>Lspsaga outline<CR>";
      options = {
        desc = "Outline";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd>Lspsaga rename<CR>";
      options = {
        desc = "Rename";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lR";
      action = "<cmd>Lspsaga finder ref<CR>";
      options = {
        desc = "Goto References";
        silent = true;
      };
    }
  ];
}
