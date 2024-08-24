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

  mosaic.neotest.enable = true;

  luaLoader.enable = pkgs.lib.mkDefault true;

  package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
}
