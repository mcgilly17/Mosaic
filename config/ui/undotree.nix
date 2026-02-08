{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.undotree = {
    enable = lib.mkDefault true;
    settings = {
      autoOpenDiff = lib.mkDefault true;
      focusOnToggle = lib.mkDefault true;
    };
  };
  keymaps = lib.mkIf config.plugins.undotree.enable [
    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Undotree";
      };
    }
  ];
}
