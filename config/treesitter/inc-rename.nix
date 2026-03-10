{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.inc-rename = {
    enable = lib.mkDefault true;
  };

  keymaps = lib.mkIf config.plugins.inc-rename.enable [
    {
      key = "<leader>rr";
      mode = ["n"];
      action.__raw = ''
        function()
        	return ":IncRename " .. vim.fn.expand("<cword>")
        end
      '';
      options = {
        noremap = true;
        silent = true;
        desc = "Incremental Rename (file)";
        expr = true;
      };
    }
  ];
}
