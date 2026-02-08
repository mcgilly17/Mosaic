{pkgs, lib, ...}: {
  plugins.web-devicons.enable = true;
  plugins.mini = {
    enable = lib.mkDefault true;
    modules = lib.mkDefault {
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
