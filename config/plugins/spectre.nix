{
  pkgs,
  config,
  ...
}: {
  plugins.spectre = {
    enable = pkgs.lib.mkDefault true;
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
