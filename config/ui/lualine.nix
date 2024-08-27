{pkgs, ...}: {
  plugins.lualine = {
    enable = pkgs.lib.mkDefault true;
    globalstatus = pkgs.lib.mkDefault true;
    disabledFiletypes.statusline = [
      "alpha"
    ];
    ignoreFocus = ["neo-tree"];
    extensions = ["fzf"];
    componentSeparators = {
      left = "|";
      right = "|";
    };
    sectionSeparators = {
      left = ""; # 
      right = ""; #  █
    };
    sections = {
      lualine_a = [
        {
          name = "mode";
          separator = {
            right = "";
          };
          icon = "󰻀";
        }
      ];
      lualine_b = [
        {
          name = "branch";
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
          name.__raw = ''
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
          name = "progress";
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
}
