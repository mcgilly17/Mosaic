{
  pkgs,
  inputs,
  ...
}: {
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
    ./snippets
    ./sets.nix
    ./treesitter
    ./ui

    # Other Plugins
    ./plugins
  ];

  # Manually installed plugins are managed here
  plugs.neotest.enable = pkgs.lib.mkDefault true;
  plugs.surround.enable = pkgs.lib.mkDefault false;
  plugs.ultimate-autopair.enable = pkgs.lib.mkDefault true;
  plugs.sidebar.enable = pkgs.lib.mkDefault true;
  plugs.stay-centered.enable = pkgs.lib.mkDefault true;
  plugs.dressing.enable = pkgs.lib.mkDefault true;
  plugs.eyeliner.enable = pkgs.lib.mkDefault true;
  plugs.nui.enable = pkgs.lib.mkDefault true;

  luaLoader.enable = pkgs.lib.mkDefault true;

  package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
}
