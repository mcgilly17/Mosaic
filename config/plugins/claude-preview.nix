{
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "claude-preview.nvim";
      version = "unstable-2026-04-25";
      src = pkgs.fetchFromGitHub {
        owner = "Cannon07";
        repo = "claude-preview.nvim";
        rev = "9ec3a336ea905666538f8ea6a97dc40ce5c5271a";
        sha256 = "1l5lb8sjn47gbn9s9fln3bvpmgspri46f56zd9yyismpqlmf1380";
      };
    })
  ];

  extraConfigLua = ''
    require("code-preview").setup({
      diff = {
        auto_open = true,
        visible_only = false,
        layout = "side_by_side_tab",
      },
    })
  '';

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>a";
      mode = [
        "n"
        "v"
      ];
      group = "AI";
      icon = "";
    }
    {
      __unkeyed-1 = "<leader>ap";
      __unkeyed-2 = "<cmd>CodePreviewToggle<cr>";
      desc = "Toggle Code Preview";
      icon = "󰚩";
    }
    {
      __unkeyed-1 = "<leader>aY";
      __unkeyed-2 = "<cmd>CodePreviewAcceptAll<cr>";
      desc = "Accept all diffs";
      icon = "󰄬";
    }
    {
      __unkeyed-1 = "<leader>aN";
      __unkeyed-2 = "<cmd>CodePreviewRejectAll<cr>";
      desc = "Reject all diffs";
      icon = "󰜺";
    }
    {
      __unkeyed-1 = "<leader>ah";
      __unkeyed-2 = "<cmd>CodePreviewInstallClaudeCodeHooks<cr>";
      desc = "Install Claude hooks";
      icon = "";
    }
    {
      __unkeyed-1 = "<leader>aH";
      __unkeyed-2 = "<cmd>CodePreviewUninstallClaudeCodeHooks<cr>";
      desc = "Uninstall Claude hooks";
      icon = "";
    }
  ];
}
