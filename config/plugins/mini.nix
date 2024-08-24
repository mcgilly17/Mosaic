{pkgs, ...}: {
  plugins.mini = {
    enable = pkgs.lib.mkDefault true;
    modules = {
      comment = {
        options = {
          customCommentString = ''
            <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
          '';
        };
      };
      cursorword = {};
      surround = {};
      ai = {};
    };
  };
}
