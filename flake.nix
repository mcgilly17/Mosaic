{
  description = "Mosaic is a custom config for NixVim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    # use nightly neovim
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-parts,
    ...
  } @ inputs: let
    inherit (self) outputs;

    overlays = import ./overlays {inherit inputs outputs;};

    mkPkgs = system:
      import nixpkgs {
        inherit system;

        overlays = builtins.attrValues overlays;

        config = {
          allowUnfree = true;
        };
      };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        self,
        config,
        pkgs,
        system,
        ...
      }: let
        inherit (nixpkgs) lib;

        myLibs = import ./lib {inherit lib;};

        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          pkgs = mkPkgs system;
          module = import ./config; # import the module directly
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit self inputs myLibs;
          };
        };

        mosaic = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          inherit mosaic;
          default = mosaic;
        };
      };
    };
}
