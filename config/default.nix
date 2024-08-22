{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Base Configs
    ./sets.nix
    ./colorschemes.nix
    ./keymaps
    ./languages
    ./lsp
    ./markdown
    ./snippets
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
