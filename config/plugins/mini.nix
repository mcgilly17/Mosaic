{pkgs, ...}: {
  plugins.web-devicons.enable = true;
  plugins.mini = {
    enable = pkgs.lib.mkDefault true;
    modules = pkgs.lib.mkDefault {
      comment = {
        options = {
          customCommentString = ''
            <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
          '';
        };
      };
      cursorword = {};
      ai = {};
    };
  };
}
