{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.dap = {
    enable = lib.mkDefault true;
    lazyLoad.settings.cmd = "DapContinue";
    signs = lib.mkDefault {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };
    configurations = {
    };
  };
  plugins.dap-ui = lib.mkDefault {
    enable = true;
    settings = {
      floating.mappings = {
        close = ["<ESC>" "q"];
      };
      dap-virtual-text = {
        enable = true;
      };
    };
  };

  keymaps = lib.mkIf config.plugins.dap.enable [
    (myLibs.mkNmap "<leader>dB" "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>" "Breakpoint Condition")
    (myLibs.mkNmap "<leader>db" ":DapToggleBreakpoint<cr>" "Toggle Breakpoint")
    (myLibs.mkNmap "<leader>dc" ":DapContinue<cr>" "Continue")
    (myLibs.mkNmap "<leader>da" "<cmd>lua require('dap').continue({ before = get_args })<cr>" "Run with Args")
    (myLibs.mkNmap "<leader>dC" "<cmd>lua require('dap').run_to_cursor()<cr>" "Run to cursor")
    (myLibs.mkNmap "<leader>dg" "<cmd>lua require('dap').goto_()<cr>" "Go to line (no execute)")
    (myLibs.mkNmap "<leader>di" ":DapStepInto<cr>" "Step into")
    (myLibs.mkNmap "<leader>dj" "<cmd>lua require('dap').down()<cr>" "Down")
    (myLibs.mkNmap "<leader>dk" "<cmd>lua require('dap').up()<cr>" "Up")
    (myLibs.mkNmap "<leader>dl" "<cmd>lua require('dap').run_last()<cr>" "Run Last")
    (myLibs.mkNmap "<leader>do" ":DapStepOut<cr>" "Step Out")
    (myLibs.mkNmap "<leader>dO" ":DapStepOver<cr>" "Step Over")
    (myLibs.mkNmap "<leader>dp" "<cmd>lua require('dap').pause()<cr>" "Pause")
    (myLibs.mkNmap "<leader>dr" ":DapToggleRepl<cr>" "Toggle REPL")
    (myLibs.mkNmap "<leader>ds" "<cmd>lua require('dap').session()<cr>" "Session")
    (myLibs.mkNmap "<leader>dt" ":DapTerminate<cr>" "Terminate")
    (myLibs.mkNmap "<leader>du" "<cmd>lua require('dapui').toggle()<cr>" "Dap UI")
    (myLibs.mkNmap "<leader>dw" "<cmd>lua require('dap.ui.widgets').hover()<cr>" "Widgets")
    (myLibs.mkNVmap "<leader>de" "<cmd>lua require('dapui').eval()<cr>" "Eval")
  ];
}
