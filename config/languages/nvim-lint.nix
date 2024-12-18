{pkgs, ...}: {
  plugins.lint = {
    enable = pkgs.lib.mkDefault true;
    lintersByFt = pkgs.lib.mkDefault {
      nix = ["statix"];
      lua = ["selene"];
      python = ["flake8"];
      prisma = ["prisma-lint"];
      javascript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      markdown = ["markdownlint-cli2"];
      typescript = ["eslint_d"];
      typescriptreact = ["eslint_d"];
      json = ["jsonlint"];
      java = ["checkstyle"];
    };
  };
}
