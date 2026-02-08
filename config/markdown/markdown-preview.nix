{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.markdown-preview = {
    enable = lib.mkDefault true;
    settings = {
      theme = lib.mkDefault "dark";
    };
  };

  keymaps = lib.mkIf config.plugins.markdown-preview.enable [
    (myLibs.mkNmap "<leader>mp" "<cmd>MarkdownPreview<cr>" "Markdown Preview")
  ];
}
