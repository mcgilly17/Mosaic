{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.mosaic.neotest;
in {
  options.mosaic.neotest.enable = lib.mkEnableOption "neotest setup";

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      # NOTE: Manual pkg install, check update
      (pkgs.vimUtils.buildVimPlugin {
        pname = "neotest-java";
        version = "v0.9.0";
        src = pkgs.fetchFromGitHub {
          owner = "rcasia";
          repo = "neotest-java";
          rev = "2234bfa8044dc39a8baf90470747c65e4623a222";
          sha256 = "0w5fvqic3qapi9ggfb81nqa9fl6jv831s91r0wgn4d7c35h0340r";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        pname = "neotest-vim-test";
        version = "2023-04-17";
        src = pkgs.fetchFromGitHub {
          owner = "nvim-neotest";
          repo = "neotest-vim-test";
          rev = "75c4228882ae4883b11bfce9b8383e637eb44192";
          sha256 = "12ix1lzmqlk3iyngaafby9c02fcl9d5iva965miwxfljvmibjnbw";
        };
      })
      neotest
      FixCursorHold-nvim
      neotest-plenary
      vim-test
      neotest-python
      neotest-vitest
    ];
    extraConfigLua = ''
      require("neotest").setup({
        adapters = {
          require("neotest-java")({
            ignore_wrapper = false,
            -- function to determine which runner to use based on project path
            determine_runner = function(project_root_path)
              -- return should be "maven" or "gradle"
              return "maven"
            end,
            -- override the builtin runner discovery behaviour to always use given
            -- tool. Default is "nil", so no override
            force_runner = nil,
            -- if the automatic runner discovery can't uniquely determine whether
            -- to use Gradle or Maven, fallback to using this runner. Default is
            -- "maven"
            fallback_runner = "gradle"
          }),
          require("neotest-python")({
          dap = { justMyCode = false },
          }),
          require "neotest-vim-test" {
          ignore_file_types = { "python", "java", "vim", "lua", "javascript", "typescript" },
          },
        },
        output = { enabled = true, open_on_run = true },
        summary = { enabled = true, },
      })
    '';
  };
}
