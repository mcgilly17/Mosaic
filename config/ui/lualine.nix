{pkgs, lib, ...}: {
  plugins.lualine = {
    enable = lib.mkDefault true;
    settings = {
      options = {
        globalstatus = lib.mkDefault true;
        disabled_filetypes = {
          statusline = ["alpha"];
        };
        ignore_focus = ["neo-tree"];
        component_separators = {
          left = "|";
          right = "|";
        };
        section_separators = {
          left = ""; #
          right = ""; #  █
        };
      };
      extensions = ["fzf"];
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            separator = {
              right = "";
            };
            icon = "󰻀";
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            separator = {
              right = "";
            };
            icon = "";
          }
          "diff"
          "diagnostics"
        ];
        lualine_c = ["filename"];
        lualine_x = ["filetype"];
        lualine_y = [
          {
            __unkeyed-1.__raw = ''
              function() return vim.fn['getcwd']() end
            '';
            icon.__raw = "{' ', color={fg='#1e1e2e',bg='#f38ba8'}}";
            separator = {
              left = "";
            };
            color = {
              fg = "#6c6f85";
              bg = "#181825";
            };
            padding = {
              right = 1;
              left = 0;
            };
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "progress";
            icon.__raw = "{' ', color={fg='#1e1e2e',bg='#a6e3a1'}}";
            separator = {
              left = "";
            };
            color = {
              fg = "#a6e3a1";
              bg = "#181825";
            };
            padding = {
              right = 1;
              left = 0;
            };
          }
        ];
      };
    };
  };
}
