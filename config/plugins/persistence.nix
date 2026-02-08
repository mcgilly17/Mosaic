{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.persistence = {
    enable = lib.mkDefault true;
  };
  keymaps = lib.mkIf config.plugins.persistence.enable [
    (myLibs.mkNmap "<leader>qs" ":lua require('persistence').load()<cr>" "Restore session")
    (myLibs.mkNmap "<leader>ql" "<cmd>lua require('persistence').load({ last = true })<cr>" "Restore last session")
    (myLibs.mkNmap "<leader>qd" "<cmd>lua require('persistence').stop()<cr>" "Don't save current session")
  ];
}
