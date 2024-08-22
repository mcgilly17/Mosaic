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

  enableMan = true; # install man pages for nixvim options

  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;

  package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
}
