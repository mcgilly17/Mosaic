{pkgs, ...}: {
  plugins.harpoon = {
    enable = pkgs.lib.mkDefault true;
    enableTelescope = pkgs.lib.mkDefault true;
    keymapsSilent = pkgs.lib.mkDefault true;
    saveOnToggle = pkgs.lib.mkDefault true;
    keymaps = {
      #Keys added to whichkey too
      addFile = "<leader>ha";
      toggleQuickMenu = "<C-e>";
      navFile = {
        "1" = "<leader>h1";
        "2" = "<leader>h2";
        "3" = "<leader>h3";
        "4" = "<leader>h4";
      };
    };
  };
}
