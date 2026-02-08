{pkgs, lib, ...}: {
  plugins.indent-blankline = {
    enable = lib.mkDefault true;
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
