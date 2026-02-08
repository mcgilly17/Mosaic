{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.telescope = {
    enable = lib.mkDefault true;
    lazyLoad.settings.cmd = "Telescope";

    extensions = {
      fzf-native = {
        enable = lib.mkDefault true;
      };
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = lib.mkDefault true;
          };
        };
      };
      undo = {
        enable = lib.mkDefault true;
      };
    };

    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep (root dir)";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Recent";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Buffers";
      };
      "<leader>fa" = {
        action = "git_files";
        options.desc = "All files in repo";
      };
      "<C-p>" = {
        action = "git_files";
        options.desc = "Search git files";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Commits";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Status";
      };
      "<leader>sa" = {
        action = "autocommands";
        options.desc = "Auto Commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Buffer";
      };
      "<leader>sc" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>sC" = {
        action = "commands";
        options.desc = "Commands";
      };
      "<leader>sD" = {
        action = "diagnostics";
        options.desc = "Workspace diagnostics";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "Help pages";
      };
      "<leader>sH" = {
        action = "highlights";
        options.desc = "Search Highlight Groups";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "Keymaps";
      };
      "<leader>sM" = {
        action = "man_pages";
        options.desc = "Man pages";
      };
      "<leader>sm" = {
        action = "marks";
        options.desc = "Jump to Mark";
      };
      "<leader>so" = {
        action = "vim_options";
        options.desc = "Options";
      };
      "<leader>sR" = {
        action = "resume";
        options.desc = "Resume";
      };
    };

    settings = {
      defaults = {
        mappings = {
          i = {
            "<esc>" = {
              __raw = ''
                function(...)
                  return require("telescope.actions").close(...)
                end'';
            };
            "<C-j>" = {
              __raw = "require('telescope.actions').move_selection_next";
            };
            "<C-k>" = {
              __raw = "require('telescope.actions').move_selection_previous";
            };
          };
        };
      };
    };
  };
  extraConfigLua = lib.mkIf config.plugins.telescope.enable ''
    local telescope = require('telescope')
    telescope.setup{
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
    }
  '';

  keymaps = lib.mkIf config.plugins.telescope.enable [
    (myLibs.mkNmap "<leader>fp" "<cmd>Telescope projects<CR>" "Projects")
    (myLibs.mkNmap "<leader>sd" "<cmd>Telescope diagnostics bufnr=0<cr>" "Document diagnostics")
    (myLibs.mkNmap "<leader>st" "<cmd>TodoTelescope<cr>" "Todo (Telescope)")
  ];
}
