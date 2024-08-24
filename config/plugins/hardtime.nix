{pkgs, ...}: {
  plugins.hardtime = {
    enable = pkgs.lib.mkDefault true;
    enabled = pkgs.lib.mkDefault true;
    #disableMouse = true;
    disabledFiletypes = ["neo-tree" "qf" "netrw" "NvimTree"];
    hint = pkgs.lib.mkDefault true;
    maxCount = 4;
    maxTime = 1000;
    restrictionMode = "hint";
    restrictedKeys = {
      "h" = ["n" "x"];
      "j" = ["n" "x"];
      "k" = ["n" "x"];
      "l" = ["n" "x"];
      "-" = ["n" "x"];
      "+" = ["n" "x"];
      "gj" = ["n" "x"];
      "gk" = ["n" "x"];
      "<CR>" = ["n" "x"];
      "<C-M>" = ["n" "x"];
      "<C-N>" = ["n" "x"];
      "<C-P>" = ["n" "x"];
    };
    disabledKeys = {
      "<Up>" = ["" "i"];
      "<Down>" = ["" "i"];
      "<Left>" = ["" "i"];
      "<Right>" = ["" "i"];
    };
  };
}
