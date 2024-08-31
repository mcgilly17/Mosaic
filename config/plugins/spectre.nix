{
  pkgs,
  config,
  ...
}: {
  plugins.spectre = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      replace = pkgs.lib.mkDefault "sed";
    };
  };

  keymaps = pkgs.lib.mkIf config.plugins.spectre.enable [
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>Spectre<cr>";
      options = {
        desc = "Find / Replace";
      };
    }
  ];
}
