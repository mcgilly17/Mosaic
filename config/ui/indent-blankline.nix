{pkgs, ...}: {
  plugins.indent-blankline = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      exclude = {
        buftypes = ["terminal" "nofile"];
        filetypes = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "trouble"
          "lazy"
          "mason"
          "notify"
          "toggleterm"
          "lazyterm"
        ];
      };
    };
  };
}
