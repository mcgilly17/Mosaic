{
  pkgs,
  config,
  ...
}: {
  plugins.harpoon = {
    enable = pkgs.lib.mkDefault true;
    enableTelescope = pkgs.lib.mkDefault true;
    keymapsSilent = pkgs.lib.mkDefault true;
    saveOnToggle = pkgs.lib.mkDefault true;
    keymaps = pkgs.lib.mkDefault {
      #Keys added to whichkey too
      addFile = "<leader>ha";
      toggleQuickMenu = "<leader>hm";
      navFile = {
        "1" = "<leader>h1";
        "2" = "<leader>h2";
        "3" = "<leader>h3";
        "4" = "<leader>h4";
      };
    };
  };
  plugins.which-key.settings.spec = pkgs.lib.optionals config.plugins.which-key.enable [
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
