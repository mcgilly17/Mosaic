{pkgs, ...}: {
  plugins.treesitter = {
    enable = pkgs.lib.mkDefault true;
    settings = pkgs.lib.mkDefault {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
      };
      auto_install = true;
      indent.enable = true;
      ensure_installed = [
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
        "lua"
        "vim"
        "dockerfile"
        "gitignore"
        "query"
      ];
    };
    folding = pkgs.lib.mkDefault true;
    nixvimInjections = pkgs.lib.mkDefault true;
  };
}
