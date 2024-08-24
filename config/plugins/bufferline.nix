{pkgs, ...}: {
  plugins = {
    bufferline = {
      enable = pkgs.lib.mkDefault true;
      settings.options = pkgs.lib.mkDefault {
        separatorStyle = "thick"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
        offsets = [
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
