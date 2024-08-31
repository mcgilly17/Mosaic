{
  pkgs,
  config,
  ...
}: {
  plugins.conform-nvim = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      notify_on_error = pkgs.lib.mkDefault true;
      formatters_by_ft = pkgs.lib.mkDefault {
        html = [["prettierd" "prettier"]];
        css = [["prettierd" "prettier"]];
        javascript = [["prettierd" "prettier"]];
        javascriptreact = [["prettierd" "prettier"]];
        typescript = [["prettierd" "prettier"]];
        typescriptreact = [["prettierd" "prettier"]];
        java = ["google-java-format"];
        json = ["jq"];
        python = ["black"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = [["markdownlint-cli2" "prettierd"]];
        rust = ["rustfmt"];
      };
    };
  };

  extraConfigLua = pkgs.lib.mkIf config.plugins.conform-nvim.enable ''
    local conform = require("conform")
    local notify = require("notify")

    conform.setup({
      format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    })

    local function show_notification(message, level)
      notify(message, level, { title = "conform.nvim" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      if is_global then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      if vim.g.disable_autoformat then
        show_notification("Autoformat-on-save disabled globally", "info")
      else
        show_notification("Autoformat-on-save enabled globally", "info")
      end
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      if vim.b.disable_autoformat then
        show_notification("Autoformat-on-save disabled for this buffer", "info")
      else
        show_notification("Autoformat-on-save enabled for this buffer", "info")
        end
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  '';

  keymaps = pkgs.lib.mkIf config.plugins.conform-nvim.enable [
    /*
    =============================================
    =              Code (Conform)               =
    =============================================
    */

    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }

    {
      mode = "v";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
  ];
}
