{lib, ...}: {
  autoGroups = {
    largefile = {clear = true;};
    spellcheck = {clear = true;};
    markdown_diagnostics = {clear = true;};
    file_reload = {clear = true;};
  };

  autoCmd = [
    # Large file handling: disable heavy features for files >1MB
    {
      event = ["BufReadPre"];
      group = "largefile";
      callback.__raw = ''
        function(args)
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > 1024 * 1024 then
            vim.b[args.buf].large_buf = true
            vim.cmd("syntax off")
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
            vim.opt_local.signcolumn = "no"
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.foldenable = false
            vim.opt_local.swapfile = false
            vim.opt_local.undofile = false
          end
        end
      '';
    }

    # Enable spell check for prose file types
    {
      event = ["FileType"];
      group = "spellcheck";
      pattern = ["markdown" "tex" "latex"];
      callback.__raw = ''
        function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us"
        end
      '';
    }

    # Disable diagnostics in markdown buffers
    {
      event = ["FileType"];
      group = "markdown_diagnostics";
      pattern = ["markdown"];
      callback.__raw = ''
        function(args)
          vim.diagnostic.enable(false, { bufnr = args.buf })
        end
      '';
    }

    # Reload files changed outside of neovim
    {
      event = ["FocusGained" "TermClose" "TermLeave"];
      group = "file_reload";
      command = "checktime";
    }
  ];
}
