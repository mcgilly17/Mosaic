{pkgs, lib, ...}: {
  plugins.treesitter = {
    enable = lib.mkDefault true;
    settings = {
      highlight = {
        enable = lib.mkDefault true;
        additional_vim_regex_highlighting = lib.mkDefault true;
      };
      auto_install = lib.mkDefault true;
      indent.enable = lib.mkDefault true;
      ensure_installed = lib.mkDefault [
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
    folding.enable = lib.mkDefault true;
    nixvimInjections = lib.mkDefault true;
  };
}
