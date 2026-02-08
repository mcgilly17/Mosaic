# Contributing to Mosaic

## Development Setup

```bash
# Test the configuration
nix run github:michaelfletchercgy/mosaic

# Or from local checkout
nix run .

# Verify changes pass checks
nix flake check
```

## Code Style

### Nix Conventions

- Use `lib.mkDefault` (not `pkgs.lib.mkDefault`)
- Include `lib` in function arguments: `{ pkgs, lib, config, ... }:`
- Use `lib.mkIf` for conditional configuration
- Use `myLibs.scanPaths ./.` in `default.nix` for auto-discovery

### Plugin Configuration

Each plugin should:
- Have its own file in the appropriate directory
- Use `enable = lib.mkDefault true;` for optional plugins
- Include `desc` for all keymaps (for which-key integration)

```nix
# Example plugin structure
{ pkgs, lib, config, ... }: {
  plugins.example = {
    enable = lib.mkDefault true;
    settings = {
      # plugin options
    };
  };
}
```

### Keymaps

- Use which-key specs for discoverability
- Include descriptive `desc` for every keymap
- Follow existing prefix conventions:
  - `<leader>a` - AI tools
  - `<leader>l` - LSP operations
  - `<leader>g` - Git operations
  - `<leader>f` - Find/search
  - `<leader>b` - Buffers

## Pull Request Process

1. Fork and create a feature branch
2. Make changes following code style above
3. Run `nix flake check` to verify
4. Test with `nix run .`
5. Submit PR with clear description

## Directory Structure

```
config/
  completion/   # Completion engine (cmp, snippets)
  git/          # Git integrations
  keymaps/      # Keymap definitions
  languages/    # Language-specific config
  lsp/          # LSP servers and tools
  markdown/     # Markdown-specific plugins
  plugins/      # General plugins
  treesitter/   # Treesitter config
  ui/           # UI components
```

## Questions?

Open an issue or discussion on GitHub.
