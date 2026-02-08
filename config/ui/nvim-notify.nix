{
  lib,
  config,
  myLibs,
  ...
}: {
  plugins.notify = {
    enable = lib.mkDefault true;
    settings = {
      background_colour = "#000000";
      fps = 60;
      render = "default";
      timeout = 1000;
      top_down = true;
    };
  };

  keymaps = lib.mkIf config.plugins.notify.enable [
    (myLibs.mkNmap "<leader>un" ''<cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>'' "Dismiss All Notifications")
  ];

  extraConfigLua = lib.mkIf config.plugins.notify.enable ''
    local notify = require("notify")
    local filtered_message = { "No information available" }

    -- Override notify function to filter out messages
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(message, level, opts)
      local merged_opts = vim.tbl_extend("force", {
        on_open = function(win)
          local buf = vim.api.nvim_win_get_buf(win)
          vim.bo[buf].filetype = "markdown"
        end,
      }, opts or {})

      for _, msg in ipairs(filtered_message) do
        if message == msg then
          return
        end
      end
      return notify(message, level, merged_opts)
    end
  '';
}
