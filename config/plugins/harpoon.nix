{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.harpoon = {
    enable = lib.mkDefault true;
    enableTelescope = lib.mkDefault true;
    autoLoad = lib.mkDefault true;
    #TODO: this is hideous, need to check it actually works.
    settings.settings = {
      save_on_toggle = true;
      sync_on_ui_close = true;
    };
  };
  keymaps = lib.mkIf config.plugins.harpoon.enable [
    {
      mode = "n";
      key = "<leader>ha";
      options.desc = "Add file";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<leader>hm";
      options.desc = "Quick Menu";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }
    {
      mode = "n";
      key = "<leader>h1";
      options.desc = "1";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<leader>h2";
      options.desc = "2";
      action.__raw = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<leader>h3";
      options.desc = "3";
      action.__raw = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<leader>h4";
      options.desc = "4";
      action.__raw = "function() require'harpoon':list():select(4) end";
    }
  ];
  plugins.which-key.settings.spec = lib.optionals config.plugins.which-key.enable [
    # Harpoon Configs
    {
      __unkeyed-1 = "<leader>h";
      mode = [
        "n"
      ];
      group = "+harpoon";
      icon = "󱡁";
    }
    {
      __unkeyed = "<leader>hm";
      mode = [
        "n"
      ];
      desc = "QuickMenu";
    }
    {
      __unkeyed-1 = "<leader>ha";
      mode = [
        "n"
      ];
      desc = "Add file to Harpoon";
    }
    {
      __unkeyed-1 = "<leader>h1";
      mode = [
        "n"
      ];
      desc = "Harpoon File 1";
    }
    {
      __unkeyed-1 = "<leader>h2";
      mode = [
        "n"
      ];
      desc = "Harpoon File 2";
    }
    {
      __unkeyed-1 = "<leader>h3";
      mode = [
        "n"
      ];
      group = "Harpoon File 3";
    }
    {
      __unkeyed-1 = "<leader>h4";
      mode = [
        "n"
      ];
      desc = "Harpoon File 4";
    }
  ];
}
