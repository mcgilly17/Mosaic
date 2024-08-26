{pkgs, ...}: {
  plugins = {
    bufferline = {
      enable = pkgs.lib.mkDefault true;
      settings.options = {
        separator_style = pkgs.lib.mkDefault "slant"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
        offsets = pkgs.lib.mkDefault [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };
}
