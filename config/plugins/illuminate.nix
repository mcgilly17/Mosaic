{pkgs, ...}: {
  plugins.illuminate = {
    enable = pkgs.lib.mkDefault false;
    underCursor = pkgs.lib.mkDefault false;
    filetypesDenylist = [
      "DressingSelect"
      "Outline"
      "TelescopePrompt"
      "alpha"
      "harpoon"
      "toggleterm"
      "neo-tree"
      "Spectre"
      "reason"
    ];
  };
}
