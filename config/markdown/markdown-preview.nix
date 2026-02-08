{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.markdown-preview = {
    enable = lib.mkDefault true;
    settings = {
      theme = lib.mkDefault "dark";
    };
  };

  keymaps = lib.mkIf config.plugins.markdown-preview.enable [
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
