{
  pkgs,
  lib,
  config,
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
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>Spectre<cr>";
      options = {
        desc = "Search / Replace";
      };
    }
  ];
}
