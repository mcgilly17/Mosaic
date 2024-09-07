{
  pkgs,
  config,
  ...
}: {
  plugins.inc-rename = {
    enable = pkgs.lib.mkDefault true;
  };

  keymaps = pkgs.lib.mkIf config.plugins.inc-rename.enable [
    {
      key = ",r";
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
