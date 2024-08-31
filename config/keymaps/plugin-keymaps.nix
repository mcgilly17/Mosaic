_: {
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps = [
    /*
    =============================================
    =                Git (GitSigns)             =
    =============================================
    */

    {
      mode = ["n" "v"];
      key = "<leader>gh";
      action = "gitsigns";
      options = {
        silent = true;
        desc = "+hunks";
      };
    }
    {
      mode = "n";
      key = "<leader>ghb";
      action = ":Gitsigns blame_line<CR>";
      options = {
        silent = true;
        desc = "Blame line";
      };
    }
    {
      mode = "n";
      key = "<leader>ghd";
      action = ":Gitsigns diffthis<CR>";
      options = {
        silent = true;
        desc = "Diff This";
      };
    }
    {
      mode = "n";
      key = "<leader>ghp";
      action = ":Gitsigns preview_hunk<CR>";
      options = {
        silent = true;
        desc = "Preview hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>ghR";
      action = ":Gitsigns reset_buffer<CR>";
      options = {
        silent = true;
        desc = "Reset Buffer";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ghr";
      action = ":Gitsigns reset_hunk<CR>";
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ghs";
      action = ":Gitsigns stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>ghS";
      action = ":Gitsigns stage_buffer<CR>";
      options = {
        silent = true;
        desc = "Stage Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>ghu";
      action = ":Gitsigns undo_stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Undo Stage Hunk";
      };
    }
    /*
    =============================================
    =                    Trouble                =
    =============================================
    */
    {
      mode = "n";
      key = "<leaderT";
      action = "+diagnostics/quickfix";
    }
    {
      mode = "n";
      key = "<leader>Tx";
      action = "<cmd>TroubleToggle<cr>";
      options = {
        silent = true;
        desc = "Document Diagnostics (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>TX";
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
      options = {
        silent = true;
        desc = "Workspace Diagnostics (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>Tt";
      action = "<cmd>TroubleToggle todo<cr>";
      options = {
        silent = true;
        desc = "Todo (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>TQ";
      action = "<cmd>TodoQuickFix<cr>";
      options = {
        silent = true;
        desc = "Quickfix List (Trouble)";
      };
    }
    /*
    =============================================
    =       Code (Conform, TSTools, Spectre)    =
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
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>Spectre<cr>";
      options = {
        desc = "Find / Replace";
      };
    }
    {
      mode = "v";
      key = "<leader>cF";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }

    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>TSToolsOrganizeImports<cr>";
      options = {
        desc = "Organize Imports";
      };
    }
    {
      mode = "n";
      key = "<leader>cR";
      action = "<cmd>TSToolsRemoveUnusedImports<cr>";
      options = {
        desc = "Remove Unused Imports";
      };
    }

    /*
    =============================================
    =                  Markdown                 =
    =============================================
    */
    {
      mode = "n";
      key = "<leader>mp";
      action = "<cmd>MarkdownPreview<cr>";
      options = {
        desc = "Markdown Preview";
      };
    }
    {
      mode = "v";
      key = "<leader>mll";
      action.__raw = ''
        function()
          -- Copy what's currently in my clipboard to the register "a lamw25wmal
          vim.cmd("let @a = getreg('+')")
          -- delete selected text
          vim.cmd("normal d")
          -- Insert the following in insert mode
          vim.cmd("startinsert")
          vim.api.nvim_put({ "[]() " }, "c", true, true)
          -- Move to the left, paste, and then move to the right
          vim.cmd("normal F[pf(")
          -- Copy what's on the "a register back to the clipboard
          vim.cmd("call setreg('+', @a)")
          -- Paste what's on the clipboard
          vim.cmd("normal p")
          -- Leave me in normal mode or command mode
          vim.cmd("stopinsert")
          -- Leave me in insert mode to start typing
          -- vim.cmd("startinsert")
        end
      '';
      options = {
        desc = "[P]Convert to link";
      };
    }
    {
      mode = "v";
      key = "<leader>mlt";
      action.__raw = ''
        function()
          -- Copy what's currently in my clipboard to the register "a lamw25wmal
          vim.cmd("let @a = getreg('+')")
          -- delete selected text
          vim.cmd("normal d")
          -- Insert the following in insert mode
          vim.cmd("startinsert")
          vim.api.nvim_put({ '[](){:target="_blank"} ' }, "c", true, true)
          vim.cmd("normal F[pf(")
          -- Copy what's on the "a register back to the clipboard
          vim.cmd("call setreg('+', @a)")
          -- Paste what's on the clipboard
          vim.cmd("normal p")
          -- Leave me in normal mode or command mode
          vim.cmd("stopinsert")
          -- Leave me in insert mode to start typing
          -- vim.cmd("startinsert")
        end
      '';
      options = {
        desc = "[P]Convert to link (new tab)";
      };
    }
    # {
    #   mode = "i";
    #   key = "<C-g>";
    #   action.__raw = ''
    #     function()
    #       -- Insert the text in the desired format
    #       vim.cmd('normal! a[](){:target="_blank"} ')
    #       vim.cmd("normal! F(pv2F/lyF[p")
    #       -- Leave me in normal mode or command mode
    #       vim.cmd("stopinsert")
    #     end
    #   '';
    #   options = {
    #     desc = "[P]Paste Github link";
    #   };
    # }
    /*
    =============================================
    =                  Telescope                =
    =============================================
    */
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope projects<CR>";
      options = {
        desc = "Projects";
      };
    }

    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }

    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options = {
        silent = true;
        desc = "Todo (Telescope)";
      };
    }

    /*
    =============================================
    =                     UI                    =
    =============================================
    */

    {
      mode = "n";
      key = "<leader>ue";
      action = ":SidebarNvimToggle<CR>";
      options = {
        desc = "Toggle Explorer";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>un";
      action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
      '';
      options = {
        desc = "Dismiss All Notifications";
      };
    }

    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Undotree";
      };
    }
  ];

  extraConfigLua = ''
    local notify = require("notify")

    local function show_notification(message, level)
      notify(message, level, { title = "conform.nvim" })
    end

    if vim.lsp.inlay_hint then
      vim.keymap.set('n', '<leader>uh', function()
        vim.lsp.inlay_hint(0, nil)
      end, { desc = 'Toggle Inlay Hints' })
    end

    -------------------------------------------------------------------------------
    --                        Folding Keymap section
    -------------------------------------------------------------------------------

    -- Use <CR> to fold when in normal mode
    -- To see help about folds use `:help fold`
    vim.keymap.set("n", "<CR>", function()
      -- Get the current line number
      local line = vim.fn.line(".")
      -- Get the fold level of the current line
      local foldlevel = vim.fn.foldlevel(line)
      if foldlevel == 0 then
        vim.notify("No fold found", vim.log.levels.INFO)
      else
        vim.cmd("normal! za")
      end
    end, { desc = "[P]Toggle fold" })

    local function set_foldmethod_expr()
      -- These are lazyvim.org defaults but setting them just in case a file
      -- doesn't have them set
      if vim.fn.has("nvim-0.10") == 1 then
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
        vim.opt.foldtext = ""
      else
        vim.opt.foldmethod = "indent"
        vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
      end
      vim.opt.foldlevel = 99
    end

    -- Function to fold all headings of a specific level
    local function fold_headings_of_level(level)
      -- Move to the top of the file
      vim.cmd("normal! gg")
      -- Get the total number of lines
      local total_lines = vim.fn.line("$")
      for line = 1, total_lines do
        -- Get the content of the current line
        local line_content = vim.fn.getline(line)
        -- "^" -> Ensures the match is at the start of the line
        -- string.rep("#", level) -> Creates a string with 'level' number of "#" characters
        -- "%s" -> Matches any whitespace character after the "#" characters
        -- So this will match `## `, `### `, `#### ` for example, which are markdown headings
        if line_content:match("^" .. string.rep("#", level) .. "%s") then
          -- Move the cursor to the current line
          vim.fn.cursor(line, 1)
          -- Fold the heading if it matches the level
          if vim.fn.foldclosed(line) == -1 then
            vim.cmd("normal! za")
          end
        end
      end
    end

    local function fold_markdown_headings(levels)
      set_foldmethod_expr()
      -- I save the view to know where to jump back after folding
      local saved_view = vim.fn.winsaveview()
      for _, level in ipairs(levels) do
        fold_headings_of_level(level)
      end
      vim.cmd("nohlsearch")
      -- Restore the view to jump to where I was
      vim.fn.winrestview(saved_view)
    end

    -- Keymap for unfolding markdown headings of level 2 or above
    vim.keymap.set("n", "<leader>mfu", function()
      -- Reloads the file to reflect the changes
      vim.cmd("edit!")
      vim.cmd("normal! zR") -- Unfold all headings
    end, { desc = "[P]Unfold all headings level 2 or above" })

    -- Keymap for folding markdown headings of level 1 or above
    vim.keymap.set("n", "<leader>mfj", function()
      -- Reloads the file to refresh folds, otherwise you have to re-open neovim
      vim.cmd("edit!")
      -- Unfold everything first or I had issues
      vim.cmd("normal! zR")
      fold_markdown_headings({ 6, 5, 4, 3, 2, 1 })
    end, { desc = "[P]Fold all headings level 1 or above" })

    -- Keymap for folding markdown headings of level 2 or above
    -- I know, it reads like "madafaka" but "k" for me means "2"
    vim.keymap.set("n", "<leader>mfk", function()
      -- Reloads the file to refresh folds, otherwise you have to re-open neovim
      vim.cmd("edit!")
      -- Unfold everything first or I had issues
      vim.cmd("normal! zR")
      fold_markdown_headings({ 6, 5, 4, 3, 2 })
    end, { desc = "[P]Fold all headings level 2 or above" })

    -- Keymap for folding markdown headings of level 3 or above
    vim.keymap.set("n", "<leader>mfl", function()
      -- Reloads the file to refresh folds, otherwise you have to re-open neovim
      vim.cmd("edit!")
      -- Unfold everything first or I had issues
      vim.cmd("normal! zR")
      fold_markdown_headings({ 6, 5, 4, 3 })
    end, { desc = "[P]Fold all headings level 3 or above" })

    -- Keymap for folding markdown headings of level 4 or above
    vim.keymap.set("n", "<leader>mf;", function()
      -- Reloads the file to refresh folds, otherwise you have to re-open neovim
      vim.cmd("edit!")
      -- Unfold everything first or I had issues
      vim.cmd("normal! zR")
      fold_markdown_headings({ 6, 5, 4 })
    end, { desc = "[P]Fold all headings level 4 or above" })

    -------------------------------------------------------------------------------
    --                         End Folding section
    -------------------------------------------------------------------------------
  '';
}
