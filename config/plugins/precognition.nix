{
  pkgs,
  config,
  lib,
  ...
}: {
  plugins.precognition = {
    enable = lib.mkDefault false;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>up";
      action.__raw = ''
        function()
          if require("precognition").toggle() then
              vim.notify("precognition on")
          else
              vim.notify("precognition off")
          end
        end
      '';

      options = {
        desc = "Precognition Toggle";
        silent = true;
      };
    }
  ];
}
