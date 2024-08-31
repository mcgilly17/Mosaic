{
  pkgs,
  config,
  ...
}: {
  plugins.markdown-preview = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      theme = pkgs.lib.mkDefault "dark";
    };
  };

  keymaps = pkgs.lib.mkIf config.plugins.markdown-preview.enable [
    {
      mode = "n";
      key = "<leader>mp";
      action = "<cmd>MarkdownPreview<cr>";
      options = {
        desc = "Markdown Preview";
      };
    }
  ];
}
