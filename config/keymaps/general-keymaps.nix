_: {
  keymaps = [
    /*
    =============================================
    =         Movement / Disable Arrows         =
    =============================================
    */
    {
      mode = ["n" "i"];
      key = "<Up>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Up arrow key";
      };
    }
    {
      mode = ["n" "i"];
      key = "<Down>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Down arrow key";
      };
    }
    {
      mode = ["n" "i"];
      key = "<Right>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Right arrow key";
      };
    }
    {
      mode = ["n" "i"];
      key = "<Left>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Left arrow key";
      };
    }

    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = {
        silent = true;
        desc = "Allow cursor to stay in the same place after appeding to current line";
      };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        silent = true;
        desc = "Allow <C-d> and <C-u> to keep the cursor in the middle";
      };
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Allow C-d and C-u to keep the cursor in the middle";
      };
    }

    # Remap for dealing with word wrap and adding jumps to the jumplist.
    {
      mode = "n";
      key = "j";
      action.__raw = "
        [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']]
      ";
      options = {
        expr = true;
        desc = "Remap for dealing with word wrap and adding jumps to the jumplist.";
      };
    }

    {
      mode = "n";
      key = "k";
      action.__raw = "
        [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']]
      ";
      options = {
        expr = true;
        desc = "Remap for dealing with word wrap and adding jumps to the jumplist.";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Allow search terms to stay in the middle";
      };
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Allow search terms to stay in the middle";
      };
    }

    /*
    =============================================
    =             Tab Navitgation               =
    =============================================
    */
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<cr>";
      options = {
        silent = true;
        desc = "Last tab";
      };
    }

    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<cr>";
      options = {
        silent = true;
        desc = "First Tab";
      };
    }

    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options = {
        silent = true;
        desc = "New Tab";
      };
    }

    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<cr>";
      options = {
        silent = true;
        desc = "Next Tab";
      };
    }

    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options = {
        silent = true;
        desc = "Close tab";
      };
    }

    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tabprevious<cr>";
      options = {
        silent = true;
        desc = "Previous Tab";
      };
    }

    /*
    =============================================
    =             Window Management             =
    =============================================
    */
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        silent = true;
        desc = "Other window";
      };
    }

    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }

    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }

    # Resize window with Ctrl + arrow keys
    {
      action = "<cmd>resize +4<CR>";
      key = "<C-Up>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Increase window height";
      };
    }
    {
      action = "<cmd>resize -4<CR>";
      key = "<C-Down>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Decrease window height";
      };
    }
    {
      action = "<cmd>vertical resize +4<CR>";
      key = "<C-Left>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Increase window width";
      };
    }
    {
      action = "<cmd>vertical resize -4<CR>";
      key = "<C-Right>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Decrease window width";
      };
    }

    /*
    =============================================
    =               Quit / Sessions             =
    =============================================
    */
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    {
      mode = "n";
      key = "<leader>qs";
      action = ":lua require('persistence').load()<cr>";
      options = {
        silent = true;
        desc = "Restore session";
      };
    }

    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>lua require('persistence').load({ last = true })<cr>";
      options = {
        silent = true;
        desc = "Restore last session";
      };
    }

    {
      mode = "n";
      key = "<leader>qd";
      action = "<cmd>lua require('persistence').stop()<cr>";
      options = {
        silent = true;
        desc = "Don't save current session";
      };
    }

    /*
    =============================================
    =               Copy / Paste                =
    =============================================
    */

    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
      options = {
        desc = "Deletes to void register and paste over";
      };
    }

    # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
    {
      mode = ["n" "v"];
      key = "<leader>y";
      action = "\"+y";
      options = {
        desc = "Copy to system clipboard";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>Y";
      action = "\"+Y";
      options = {
        desc = "Copy to system clipboard";
      };
    }

    # Delete to void register
    {
      mode = ["n" "v"];
      key = "<leader>D";
      action = "\"_d";
      options = {
        desc = "Delete to void register";
      };
    }

    /*
    =============================================
    =               Visual Mode                 =
    =============================================
    */

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }

    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }

    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
        desc = "Indent while remaining in visual mode.";
      };
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
        desc = "Indent while remaining in visual mode.";
      };
    }

    /*
    =============================================
    =                   Debugging               =
    =============================================
    */
    {
      mode = "n";
      key = "<leader>dB";
      action = "
        <cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
      ";
      options = {
        silent = true;
        desc = "Breakpoint Condition";
      };
    }
    {
      mode = "n";
      key = "<leader>db";
      action = ":DapToggleBreakpoint<cr>";
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":DapContinue<cr>";
      options = {
        silent = true;
        desc = "Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>da";
      action = "<cmd>lua require('dap').continue({ before = get_args })<cr>";
      options = {
        silent = true;
        desc = "Run with Args";
      };
    }
    {
      mode = "n";
      key = "<leader>dC";
      action = "<cmd>lua require('dap').run_to_cursor()<cr>";
      options = {
        silent = true;
        desc = "Run to cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>dg";
      action = "<cmd>lua require('dap').goto_()<cr>";
      options = {
        silent = true;
        desc = "Go to line (no execute)";
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ":DapStepInto<cr>";
      options = {
        silent = true;
        desc = "Step into";
      };
    }
    {
      mode = "n";
      key = "<leader>dj";
      action = "
        <cmd>lua require('dap').down()<cr>
      ";
      options = {
        silent = true;
        desc = "Down";
      };
    }
    {
      mode = "n";
      key = "<leader>dk";
      action = "<cmd>lua require('dap').up()<cr>";
      options = {
        silent = true;
        desc = "Up";
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = "<cmd>lua require('dap').run_last()<cr>";
      options = {
        silent = true;
        desc = "Run Last";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ":DapStepOut<cr>";
      options = {
        silent = true;
        desc = "Step Out";
      };
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = ":DapStepOver<cr>";
      options = {
        silent = true;
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>dp";
      action = "<cmd>lua require('dap').pause()<cr>";
      options = {
        silent = true;
        desc = "Pause";
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = ":DapToggleRepl<cr>";
      options = {
        silent = true;
        desc = "Toggle REPL";
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = "<cmd>lua require('dap').session()<cr>";
      options = {
        silent = true;
        desc = "Session";
      };
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = ":DapTerminate<cr>";
      options = {
        silent = true;
        desc = "Terminate";
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<cr>";
      options = {
        silent = true;
        desc = "Dap UI";
      };
    }
    {
      mode = "n";
      key = "<leader>dw";
      action = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
      options = {
        silent = true;
        desc = "Widgets";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>de";
      action = "<cmd>lua require('dapui').eval()<cr>";
      options = {
        silent = true;
        desc = "Eval";
      };
    }
    /*
    =============================================
    =                   Misc                    =
    =============================================
    */
    {
      action = "<cmd>nohl<CR>";
      key = "<C-n>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Clear search highlight";
      };
    }
  ];
}
