{
  pkgs,
  config,
  ...
}: {
  plugins.undotree = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      autoOpenDiff = pkgs.lib.mkDefault true;
      focusOnToggle = pkgs.lib.mkDefault true;
    };
  };
  keymaps = pkgs.lib.mkIf config.plugins.undotree.enable [
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
