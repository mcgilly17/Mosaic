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
            left = "";
          };
          padding = 2;
        }
      ];
      lualine_b = [
        {
          name = "branch";
          icon = "";
        }
        "diff"
        "diagnostics"
      ];
      lualine_c = ["filename"];
      lualine_x = ["filetype"];
      lualine_y = ["progress"];
      lualine_z = [
        {
          name = ''" " .. os.date("%R")'';
          separator = {
            right = "";
          };
          padding = 2;
        }
      ];
    };
  };
}
