{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Base Configs
    ./keymaps.nix
    ./sets.nix
    ./colorschemes.nix
    #
    # Plugins
    ./plugins
  ];

  enableMan = true; # install man pages for nixvim options

  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;

  package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
}
