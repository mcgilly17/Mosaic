{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.spectre = {
    # Disabled: spectre_oxi fails to link against LuaJIT on macOS arm64
    # See: https://github.com/nvim-pack/nvim-spectre/issues/185
    enable = lib.mkDefault false;
    settings = {
      replace = lib.mkDefault "sed";
      use_trouble_qf = true;
    };
  };

  keymaps = lib.mkIf config.plugins.spectre.enable [
    (myLibs.mkNmap "<leader>cs" "<cmd>Spectre<cr>" "Search / Replace")
  ];
}
