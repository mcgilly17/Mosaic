{
  pkgs,
  config,
  ...
}: {
  plugins.spectre = {
    # Disabled: spectre_oxi fails to link against LuaJIT on macOS arm64
    # See: https://github.com/nvim-pack/nvim-spectre/issues/185
    enable = pkgs.lib.mkDefault false;
    settings = {
      replace = pkgs.lib.mkDefault "sed";
      use_trouble_qf = true;
    };
  };

  keymaps = pkgs.lib.mkIf config.plugins.spectre.enable [
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
