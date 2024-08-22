#
# This file defines overlays/custom modifications to upstream packages
#
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: {
    # Add any additional packages in here
    #
    #
  };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: let ... in {
    # ...
    # });
    vimPlugins =
      prev.vimPlugins
      // {
        eyeliner-nvim = prev.vimPlugins.eyeliner-nvim.overrideAttrs (oldAttrs: {
          version = "2024-08-09";
          src = final.fetchFromGitHub {
            owner = "jinh0";
            repo = "eyeliner.nvim";
            rev = "7385c1a29091b98ddde186ed2d460a1103643148";
            hash = "sha256-PyCcoSC/LeJ/Iuzlm5gd/0lWx8sBS50Vhe7wudgZzqM=";
          };
        });
      };

    # NOTE: Cant get this to work as the cargoHash is still set to the 0.40.1 versions
    # and there isnt a new one yet. If anyone understands how to overcome this, please
    # let me know!

    # TODO: remove after https://github.com/NixOS/nixpkgs/pull/335559 is available in nixos-unstable
    vscode-langservers-extracted = prev.vscode-langservers-extracted.overrideAttrs {
      buildPhase = let
        extensions =
          if prev.stdenv.isDarwin
          then "../VSCodium.app/Contents/Resources/app/extensions"
          else "../resources/app/extensions";
      in ''
        npx babel ${extensions}/css-language-features/server/dist/node \
          --out-dir lib/css-language-server/node/
        npx babel ${extensions}/html-language-features/server/dist/node \
          --out-dir lib/html-language-server/node/
        npx babel ${extensions}/json-language-features/server/dist/node \
          --out-dir lib/json-language-server/node/
        cp -r ${prev.vscode-extensions.dbaeumer.vscode-eslint}/share/vscode/extensions/dbaeumer.vscode-eslint/server/out \
          lib/eslint-language-server
      '';
    };
  };
}
