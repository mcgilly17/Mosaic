{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.plugins.precognition;
in {
  options.plugins.precognition.enable = lib.mkEnableOption "precognition setup";

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [precognition-nvim];

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
  };
}
