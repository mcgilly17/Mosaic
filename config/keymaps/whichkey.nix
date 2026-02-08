{pkgs, lib, ...}: {
  plugins.which-key = {
    enable = lib.mkDefault true;
    settings = {
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
          __unkeyed-1 = "<leader>f";
          mode = "n";
          group = "+find/file";
        }

        {
          __unkeyed-1 = "<leader>g";
          mode = [
            "n"
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
          __unkeyed-1 = "<leader><Tab>";
          mode = "n";
          group = "+tabs";
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
      ];
      win = {
        border = "none";
        wo.winblend = 0;
      };
    };
  };
}
