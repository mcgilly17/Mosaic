{
  lib,
  config,
  myLibs,
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
    (myLibs.mkNmap "<leader>ut" "<cmd>UndotreeToggle<CR>" "Undotree")
  ];
}
