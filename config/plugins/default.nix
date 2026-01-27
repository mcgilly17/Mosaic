{
  imports = [
    ./avante.nix # Cursor style AI Code co-pilot
    ./claude-code.nix # Claude Code CLI integration for neovim
    ./better-escape.nix # plugin to enable escaping insert mode with keys like jj and reducing the delay
    ./dap.nix # debugger
    ./hop.nix
    ./hardtime.nix # plugin to enforce good vim movements
    ./harpoon.nix # plugin from primeagen for managing lists of files you need to work on
    ./mini.nix # swiss army knife for neovim all written in lua
    ./neotest.nix # testing plugin
    ./nvim-colorizer.nix # color highlighting plugin
    ./nvim-surround.nix # helping surround text - similar to autopair but works around existing text
    ./oil.nix # file management in a simple buffer!
    ./persistence.nix # session management
    ./project-nvim.nix # project management with integration to telescope
    ./spectre.nix # Find and replace from neovim
    ./telescope.nix # plugin for everything search in neovim
    ./tmux-navigator.nix # TMUX navigation in neovim
    ./todo-comments.nix # sweet hiighlighting for todos etc
    ./toggleterm.nix # terminal management in neovim
    ./refactoring.nix # primeagen's refactoring plugin
    ./precognition.nix # visible movement options
    ./ultimate-autopair.nix # plugin that auto pairs parenthesis/braces/brackets etc
  ];
}
