{
  pkgs,
  inputs,
  ...
}: {
  # Manually installed plugins are managed here
  plugins = {
    mosaic-testing.enable = pkgs.lib.mkDefault true;
    mosaic-surround.enable = pkgs.lib.mkDefault true;
    ultimate-autopair.enable = pkgs.lib.mkDefault true;
    sidebar.enable = pkgs.lib.mkDefault true;
    stay-centered.enable = pkgs.lib.mkDefault true;
    dressing.enable = pkgs.lib.mkDefault true;
    nui.enable = pkgs.lib.mkDefault true;
    rainbow-indent.enable = pkgs.lib.mkDefault true;
  };

  imports = [
    # Base Configs
    ./colorschemes.nix
    ./completion
    ./git
    ./keymaps
    ./languages
    ./lsp
    ./markdown
    ./pluginmanagers
    ./sets.nix
    ./treesitter
    ./ui

    # Other Plugins
    ./plugins
  ];

  luaLoader.enable = pkgs.lib.mkDefault true;
}
