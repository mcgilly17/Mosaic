<div align="center">
    <a href='#'><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px"/></a>
    <br>
    <br>
    <div>
        <a href="https://github.com/mcgilly17/Mosaic/issues">
            <img src="https://img.shields.io/github/issues/mcgilly17/Mosaic?color=fab387&labelColor=303446&style=for-the-badge">
        </a>
        <a href="https://github.com/mcgilly17/Mosaic">
            <img src="https://img.shields.io/github/repo-size/mcgilly17/Mosaic?color=ea999c&labelColor=303446&style=for-the-badge">
        </a>
        <a href="https://github.com/mcgilly17/Mosaic/blob/main/LICENCE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=ca9ee6&colorA=313244&colorB=cba6f7"/>
        </a>
        <br>
    </div>
</div>

# Mosaic

Mosaic is a fully customized Neovim config, built with Nix and the
[Nixvim flake](https://github.com/nix-community/nixvim) flake. It combines selected
features, plugins, and customizations into a powerful, cohesive coding environment.
Like its namesake, Mosaic integrates various elements to create a seamless
experience for developers of all levels. Whether you're a seasoned pro or
just starting, Mosaic adapts to your workflow, letting you focus on writing great
code without the hassle of setup.

This project draws inspiration from others, especially Redyf’s
[Neve](<https://github.com/redyf/Neve>) and khaneliman’s
[khanelivim](<https://github.com/khaneliman/khanelivim>).
I’m not an expert in Nix, NixVim, or Neovim, so please
don’t expect perfection—I’m just having fun.
<details>
    <summary>Screenshots</summary>

![Screenshot](assets/screenshot-1.png)
![Screenshot](assets/screenshot-2.png)
</details>

## Features

- **Declarative Configuration:** Nix expressions for a clean and maintainable
Neovim setup. Easily add, remove, or update plugins, LSP servers, and other
components.

- **Lazy Loading:** Plugins are lazy-loaded via [lz-n](https://github.com/nvim-neorocks/lz-n)
for fast startup times.

- **Large File Handling:** Files over 1MB automatically have syntax highlighting,
line numbers, and other heavy features disabled for smooth editing.

- **Navigation:** [Flash.nvim](https://github.com/folke/flash.nvim) for fast
jumping with labels on `f/F/t/T` motions and `<leader>j` shortcuts for
character, line, and treesitter jumps.

- **Search & Replace:** [grug-far](https://github.com/MagicDuck/grug-far.nvim)
for project-wide and per-file search/replace with `<leader>rg/rw/rW`.

- **LSP Integration:** Built-in support for language servers with comprehensive
diagnostics (severity-sorted, virtual text, custom signs), incremental
rename (`<leader>rr`), and code actions.

- **Extensible:** Designed to be brought into your own Nix configurations.
Extend or customize plugins, keymaps, and settings while keeping
declarative configuration benefits.

- **Spell Check:** Automatically enabled for markdown and LaTeX files.

## Installation

Installing and using Mosaic is pretty straight forward, but you have many options!

### Try it out

You can first just try out the config by running the following:

```bash
nix run github:mcgilly17/Mosaic
```

### Direct Install

You can add Mosaic as a flake input to you systems nix configuration and adding to
environment.systemPackages or home.packages

```nix
{
  inputs.mosaic.url = "github:mcgilly17/Mosaic";

  outputs = { mosaic }: {

    # Add to your system packages or home-manager packages.
    environment.systemPackages = [
      mosaic.packages.${pkgs.system}.default
    ];

    # Home manager installation might work like this
    # assuming you are in a different file:
    home.packages = [
      inputs.mosaic.packages.${pkgs.system}.default
    ];

  };
}
```

### Overlay Installation

You can add Mosaic as an overlay to nixpkgs

```nix
# This one brings our custom packages from the 'pkgs' directory
overlays.additions = final: _prev: {
  mosaic = inputs.mosaic.packages.${final.pkgs.system}.default;
};

# Mosaic is now available in pkgs wherever you want to use it
home.packages = [
  pkgs.mosaic
];

```

## Extending Mosaic

I am **attempting** to make Mosaic fully extensible. By that I mean, anyone
should be able to bring Mosaic into their configs and with relative ease: add,
remove and overwrite any setting or plugin. If anyone knows how to make Mosaic more modular,
please don't hesitate to raise an issue / discussion / PR.

### Simple Extension

Basic level configurations and settings updates can be done as follows:

```nix
home.packages = [
  (pkgs.mosaic.extend {
    config = {
      # https://nix-community.github.io/nixvim/NeovimOptions/index.html
      # All options are available at the link above.

      # Some core configs for nixvim that are not set in mosaic
      enableMan = true;
      viAlias = true;
      vimAlias = true;

      # In Mosaic, some of the plugins are installed manually
      # using vimUtils.buildVimPlugin. In those coses, in order
      # to disable the plugin you have access to plugs.pluginNAME
      plugs.sidebar.enable = false;

      plugins = {
        # all available LSPs to enable can be found in the nixvim docs
        # https://nix-community.github.io/nixvim/plugins/lsp/servers/beancount/index.html
        lsp.servers = {
          # You can enable new language servers or disable existing ones as follows
          beancount.enable = true;
        };

        # If there is a plugin you would like to install that isn't
        # already added in Mosaic, you can add it here (or commit a PR!!)
        # all plugins for nixvim that can be enabled can be found here:
        # https://nix-community.github.io/nixvim/plugins/barbecue/index.html
        barbeque.enable = true;

        # It's not just about enabling or disabling plugins, you can
        # also overwrite settings.
        bufferline.settings.options.separator_style = "thick";
      };

      keymaps = [
        {
          mode = ["i" "v"];
          action = "<Esc>";
          key = "oo";
        }
      ];
    };
  })
];
```

### Other Plugins

Many times Nixvim wont have a plugin immediately available to install. In those
cases you can extend Mosiac and install the plugin. Or feel free to raise a PR
with the new plugin installed!

Below you will see two examples of installation. One by simply adding it from
pkgs.vimPlugins and the other when its not available and needs to be built.

The example of "building a plugin" below is what I use to install Fugit2. It's
an odd example as I couldn't work out a way to install it in Mosaic given its
need to add the path to libgit2 which can only installed in my nix configs.

```nix
home.packages = [
  (pkgs.mosaic.extend {
    #### Rest of your configs #####

    config = {
      extraPlugins = with pkgs.vimPlugins; [
          # If the plugin is available in pkgs.vimPlugins (check on nixpkgs)
          # then it can be added by name, for example:
          nvim-surround

          # If the plugin doesnt exist in vimPlugins, then you can build
          # the plugin as you can see below. An easy way to get the sha256
          # is to leave it empty, run a check flake and it will error with
          # the right sha for you!
          (buildVimPlugin {
              pname = "fugit2.nvim";
              version = "0.2.1";
              src = pkgs.fetchFromGitHub {
                owner = "SuperBo";
                repo = "fugit2.nvim";
                rev = "e8b262d3f974a301b9efae98a571e6c9e635ab16";
                sha256 = "sha256-U9Ve7mgJlQwArgDBOXC2ezaaG7zIOJalLEl5Hyw2jMA=";
              };
          })
      ];
      extraConfigLua = ''
          require('fugit2').setup{
              libgit2_path = '${pkgs.libgit2.outPath}/lib/libgit2.1.7.2.dylib',
              external_diffview = true,
          }
      '';
    };
  })
];
```

## Structure

Here is a quick description of some of the most important folders and files in Mosaic

- **config/default.nix** The core file where all plugins are enabled and imports are managed.

- **config/sets.nix** Add, remove, or adjust Neovim options and settings.

- **config/autocommands.nix** Auto-commands for large file handling, spell check, and file reload.

- **config/keymaps/*** Customize key mappings to boost productivity.

- **config/lsp/*** Configure Language Servers, diagnostics, and formatting.

- **config/completion/*** Manage completion and snippets.

- **config/plugins/*** Additional plugins (flash, grug-far, harpoon, telescope, etc.)

## Support

Encountered an issue or have a question? Visit the
[Issue Tracker](<https://github.com/mcgilly17/Mosaic/issues>)

## Contribution

Contributions are encouraged! Please
[open an issue](<https://github.com/mcgilly17/Mosaic/issues>) to report problems,
suggest improvements, or submit pull requests to add new features to Mosaic.

## License

This project is licensed under the [MIT License](LICENCE). See the LICENSE file
for more details.
