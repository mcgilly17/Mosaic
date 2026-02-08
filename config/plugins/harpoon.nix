{
  lib,
  config,
  myLibs,
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
    (myLibs.mkRawmap "n" "<leader>ha" "function() require'harpoon':list():add() end" "Add file")
    (myLibs.mkRawmap "n" "<leader>hm" "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end" "Quick Menu")
    (myLibs.mkRawmap "n" "<leader>h1" "function() require'harpoon':list():select(1) end" "1")
    (myLibs.mkRawmap "n" "<leader>h2" "function() require'harpoon':list():select(2) end" "2")
    (myLibs.mkRawmap "n" "<leader>h3" "function() require'harpoon':list():select(3) end" "3")
    (myLibs.mkRawmap "n" "<leader>h4" "function() require'harpoon':list():select(4) end" "4")
  ];
  plugins.which-key.settings.spec = lib.optionals config.plugins.which-key.enable [
    {
      __unkeyed-1 = "<leader>h";
      mode = ["n"];
      group = "+harpoon";
      icon = "󱡁";
    }
    {
      __unkeyed = "<leader>hm";
      mode = ["n"];
      desc = "QuickMenu";
    }
    {
      __unkeyed-1 = "<leader>ha";
      mode = ["n"];
      desc = "Add file to Harpoon";
    }
    {
      __unkeyed-1 = "<leader>h1";
      mode = ["n"];
      desc = "Harpoon File 1";
    }
    {
      __unkeyed-1 = "<leader>h2";
      mode = ["n"];
      desc = "Harpoon File 2";
    }
    {
      __unkeyed-1 = "<leader>h3";
      mode = ["n"];
      group = "Harpoon File 3";
    }
    {
      __unkeyed-1 = "<leader>h4";
      mode = ["n"];
      desc = "Harpoon File 4";
    }
  ];
}
