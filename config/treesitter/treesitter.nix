{pkgs, ...}: {
  plugins.treesitter = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      highlight = {
        enable = pkgs.lib.mkDefault true;
        additional_vim_regex_highlighting = pkgs.lib.mkDefault true;
      };
      auto_install = pkgs.lib.mkDefault true;
      indent.enable = pkgs.lib.mkDefault true;
      ensure_installed = pkgs.lib.mkDefault [
        "json"
        "javascript"
        "typescript"
        "tsx"
        "yaml"
        "html"
        "css"
        "prisma"
        "markdown"
        "markdown_inline"
        "svelte"
        "graphql"
        "bash"
        "nix"
        "lua"
        "vim"
        "dockerfile"
        "gitignore"
        "query"
      ];
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = ",,"; #set to `false` to disable one of the mappings;
          node_incremental = ",+";
          scope_incremental = ",s";
          node_decremental = ",-";
        };
      };
    };
    folding = pkgs.lib.mkDefault true;
    nixvimInjections = pkgs.lib.mkDefault true;
  };
}
