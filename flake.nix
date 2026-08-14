{
  description = "Mosaic is a custom config for NixVim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nix-systems/default dropped x86_64-darwin in late 2025; pin the rev
    # that still lists all four systems so nixvim exposes Intel darwin
    # outputs (needed for glados, the Mac Pro 2019).
    systems.url = "github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e";
    nixvim = {
      url = "github:nix-community/nixvim";
      # Follows restored (previously removed to let nixvim use its own
      # tested nixpkgs): nixvim's own pin is unstable, which now throws on
      # x86_64-darwin. Following our nixpkgs lets the consuming flake
      # (dots) redirect the whole editor stack to a branch that still
      # supports Intel Macs.
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
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
