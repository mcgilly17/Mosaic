{pkgs, ...}: {
  plugins.which-key = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = "➜"; # ➜
      };
      triggersNoWait = ["<leader>"];
      sort = ["alphanum"];
      spec = [
        # Top Level Configs
        {
          __unkeyed-1 = "<leader>b";
          mode = [
            "n"
          ];
          group = "+buffers";
        }
        {
          __unkeyed-1 = "<leader>c";
          mode = [
            "n"
            "v"
          ];
          group = "+code";
        }
        {
          __unkeyed-1 = "<leader>d";
          mode = [
            "n"
            "v"
          ];
          group = "+debug";
        }
        {
          __unkeyed-1 = "<leader>l";
          mode = [
            "n"
            "v"
          ];
          group = "+LSP";
          icon = "󰬓";
        }
        {
          __unkeyed-1 = "<leader>f";
          mode = "n";
          group = "+find/file";
        }

        {
          __unkeyed-1 = "<leader>g";
          mode = [
            "n"
            "v"
          ];
          group = "+git";
        }

        {
          __unkeyed-1 = "<leader>m";
          mode = [
            "n"
            "v"
          ];
          group = "+markdown";
          icon = "";
        }

        {
          __unkeyed-1 = "<leader>q";
          mode = "n";
          group = "+quit/session";
        }

        {
          __unkeyed-1 = "<leader>s";
          mode = "n";
          group = "+search";
        }

        {
          __unkeyed-1 = "<leader>S";
          mode = "n";
          group = "+surround";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader><Tab>";
          mode = "n";
          group = "+tabs";
        }

        {
          __unkeyed-1 = "<leader>t";
          mode = [
            "n"
          ];
          group = "+test";
        }
        {
          __unkeyed-1 = "<leader>T";
          mode = [
            "n"
          ];
          group = "+trouble";
        }

        {
          __unkeyed-1 = "<leader>u";
          mode = "n";
          group = "+ui";
        }

        {
          __unkeyed-1 = "<leader>w";
          mode = "n";
          group = "+windows";
        }

        # Code Configs
        {
          __unkeyed-1 = "<leader>cs";
          mode = [
            "n"
          ];
          group = "+swap";
        }
        {
          __unkeyed-1 = "<leader>csn";
          mode = [
            "n"
          ];
          group = "+next";
        }
        {
          __unkeyed-1 = "<leader>csp";
          mode = [
            "n"
          ];
          group = "+previous";
        }
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
          __unkeyed-1 = "<leader>ha";
          mode = [
            "n"
          ];
          desc = "Add file to Harpoon";
        }
        {
          __unkeyed = "<leader>he";
          mode = [
            "n"
          ];
          desc = "QuickMenu";
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

        # Markdown Configs
        {
          __unkeyed-1 = "<leader>ml";
          mode = [
            "n"
            "v"
          ];
          group = "+links";
        }

        {
          __unkeyed-1 = "<leader>mf";
          mode = [
            "n"
            "v"
          ];
          group = "+fold";
        }

        # LSP Configs
      ];
      win = {
        border = "none";
        wo.winblend = 0;
      };
    };
  };
}
