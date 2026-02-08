{
  lib,
  myLibs,
  ...
}: {
  plugins.precognition = {
    enable = lib.mkDefault false;
  };
  keymaps = [
    (myLibs.mkRawmap "n" "<leader>up" ''
      function()
        if require("precognition").toggle() then
          vim.notify("precognition on")
        else
          vim.notify("precognition off")
        end
      end
    '' "Precognition Toggle")
  ];
}
