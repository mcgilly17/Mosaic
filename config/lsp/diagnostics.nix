{lib, ...}: {
  diagnostic.settings = {
    severity_sort = true;
    update_in_insert = true;

    virtual_text = {
      severity.min = "WARN";
      source.__raw = ''
        function(namespace, bufnr)
          local sources = {}
          local diagnostics = vim.diagnostic.get(bufnr)
          for _, d in ipairs(diagnostics) do
            if d.source then
              sources[d.source] = true
            end
          end
          local count = 0
          for _ in pairs(sources) do count = count + 1 end
          return count > 1
        end
      '';
    };

    virtual_lines = {
      current_line = true;
    };

    float = {
      border = "rounded";
    };

    jump = {
      severity.min = "WARN";
    };

    signs = {
      text = {
        "vim.diagnostic.severity.ERROR" = "";
        "vim.diagnostic.severity.WARN" = "";
        "vim.diagnostic.severity.HINT" = "󰌵";
        "vim.diagnostic.severity.INFO" = "";
      };
    };
  };
}
