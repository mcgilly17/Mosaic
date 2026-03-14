{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.oil = {
    enable = lib.mkDefault true;
    lazyLoad.settings.cmd = "Oil";
    settings = {
      use_default_keymaps = true;
      delete_to_trash = true;
      view_options = {
        show_hidden = true;
      };
      preview = {
        border = "rounded";
      };

      float = {
        padding = 2;
        max_width = 0; # ''math.ceil(vim.o.lines * 0.8 - 4)'';
        max_height = 0; # ''math.ceil(vim.o.columns * 0.8)'';
        border = "rounded"; # 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        win_options = {
          winblend = 0;
        };
      };
      keymaps = {
        "g?" = "actions.show_help";
        "<CR>" = "actions.select";
        "<C-\\>" = "actions.select_vsplit";
        "<C-enter>" = "actions.select_split"; # this is used to navigate left
        "<C-t>" = "actions.select_tab";
        "<C-p>" = "actions.preview";
        "<C-c>" = "actions.close";
        "<C-r>" = "actions.refresh";
        "-" = "actions.parent";
        "_" = "actions.open_cwd";
        "`" = "actions.cd";
        "~" = "actions.tcd";
        "gs" = "actions.change_sort";
        "gx" = "actions.open_external";
        "g." = "actions.toggle_hidden";
        "q" = "actions.close";
      };
    };
  };

  plugins.which-key.settings.spec = lib.optionals config.plugins.oil.enable [
    {
      __unkeyed-1 = "<leader>o";
      __unkeyed-2 = "<cmd>Oil --float<CR>";
      mode = "n";
      desc = "Open directory";
      silent = true;
      icon = "";
    }
  ];
}
