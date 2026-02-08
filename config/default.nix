{pkgs, lib, ...}: {
  # Manually installed plugins are managed here
  plugins = {
    mosaic-testing.enable = lib.mkDefault false;
    mosaic-surround.enable = lib.mkDefault true;
    ultimate-autopair.enable = lib.mkDefault true;
    sidebar.enable = lib.mkDefault true;
    stay-centered.enable = lib.mkDefault true;
    dressing.enable = lib.mkDefault true;
    nui.enable = lib.mkDefault true;
    rainbow-indent.enable = lib.mkDefault false;
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
    # ./pluginmanagers
    ./sets.nix
    ./treesitter
    ./ui

    # Other Plugins
    ./plugins
  ];

  luaLoader.enable = lib.mkDefault true;
}
