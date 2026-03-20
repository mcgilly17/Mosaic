{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.plugins.rainbow-indent;
in {
  # Make rainbow indent optional, as well as rainbow delimiters
  options.plugins.rainbow-indent.enable = lib.mkEnableOption "rainbow Indents";

  config = lib.mkIf cfg.enable {
    # install rainbow delimiters
    plugins.rainbow-delimiters.enable = lib.mkDefault true;
    #install rainbow-indent, a plugin that will recreate the vscode like indents
    extraPlugins = with pkgs; [
      (vimUtils.buildVimPlugin {
        pname = "indent-rainbowline.nvim";
        version = "0.1.0";
        src = fetchFromGitHub {
          owner = "TheGLander";
          repo = "indent-rainbowline.nvim";
          rev = "572e8157de85d7af3f0085b5c74c059518900649";
          sha256 = "sha256-dSXNtbyPY5ZWT/RCYsmy/swgErJm7zSfaDd5J+15wYc=";
        };
        # Plugin requires ibl at runtime, which isn't available during the build check
        nvimSkipModules = ["indent-rainbowline"];
      })
    ];

    # Override rainbow-delimiters JS query to remove parenthesized_expression,
    # which adds nesting levels without adding indentation (e.g. return (...),
    # ternary ? (...)), causing color mismatch with indent backgrounds.
    # TS and TSX inherit from JS so this fixes all three.
    extraFiles."after/queries/javascript/rainbow-delimiters.scm".text = ''
      (template_substitution
        "''${" @delimiter
        "}"  @delimiter @sentinel) @container

      (object
        "{" @delimiter
        "}" @delimiter @sentinel) @container

      (computed_property_name
        "[" @delimiter
        "]" @delimiter @sentinel) @container

      (statement_block
        "{" @delimiter
        "}" @delimiter @sentinel) @container

      (class_body
        "{" @delimiter
        "}" @delimiter @sentinel) @container

      (switch_body
        "{" @delimiter
        "}" @delimiter @sentinel) @container

      (arguments
        "(" @delimiter
        ")" @delimiter @sentinel) @container

      (formal_parameters
        "(" @delimiter
        ")" @delimiter @sentinel) @container

      (for_statement
        "(" @delimiter
        ")" @delimiter @sentinel) @container

      (for_in_statement
        "(" @delimiter
        ")" @delimiter @sentinel) @container

      (subscript_expression
        "[" @delimiter
        "]" @delimiter @sentinel) @container

      (named_imports
        "{" @delimiter
        "}" @delimiter @sentinel) @container

      (export_clause
        "{" @delimiter
        "}" @delimiter @sentinel) @container

      (object_pattern
        "{" @delimiter
        "}" @delimiter @sentinel) @container

      (array
        "[" @delimiter
        "]" @delimiter @sentinel) @container

      (array_pattern
        "[" @delimiter
        "]" @delimiter @sentinel) @container
    '';

    extraConfigLuaPost = ''
      local highlight = {
        "RainbowRed",
        "RainbowGreen",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba6f7" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#94e2d5" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      -- Build the base ibl opts so make_opts has something to merge into.
      -- These mirror the exclude settings from indent-blankline.nix.
      local ibl_opts = {
        exclude = {
          buftypes = { "terminal", "nofile" },
          filetypes = {
            "help", "alpha", "dashboard", "neo-tree",
            "Trouble", "trouble", "lazy", "mason",
            "notify", "toggleterm", "lazyterm",
          },
        },
      }

      -- make_opts merges rainbow background colors into the ibl config
      local merged = require("indent-rainbowline").make_opts(ibl_opts, {
        color_transparency = 0.35,
        colors = { 0xf38ba8, 0xa6e3a1, 0xf9e2af, 0x89b4fa, 0xfab387, 0xcba6f7, 0x94e2d5 },
      })

      -- Add scope highlighting after make_opts, so indent-rainbowline
      -- doesn't try to resolve our custom highlight group names.
      -- Explicit node types per language — use :InspectTree to find more.
      merged.scope = {
        highlight = highlight,
        include = {
          -- These extend ibl's built-in defaults to match rainbow-delimiters'
          -- @container nodes. Use :InspectTree to find types for other languages.
          node_type = {
            nix = {
              "attrset_expression", "rec_attrset_expression",
              "let_expression", "function_expression",
              "list_expression", "if_then_else_expression",
              "with_expression",
            },
            javascript = {
              "object", "array", "array_pattern", "object_pattern",
              "arguments", "formal_parameters", "class_body",
              "switch_body", "template_substitution",
              "named_imports", "export_clause",
            },
            typescript = {
              "object", "array", "array_pattern", "object_pattern",
              "arguments", "formal_parameters", "class_body",
              "switch_body", "template_substitution",
              "named_imports", "export_clause",
              "interface_body", "enum_body", "type_arguments",
              "type_parameters", "object_type", "tuple_type",
            },
            tsx = {
              "object", "array", "array_pattern", "object_pattern",
              "arguments", "formal_parameters", "class_body",
              "switch_body", "template_substitution",
              "named_imports", "export_clause",
              "interface_body", "enum_body", "type_arguments",
              "type_parameters", "object_type", "tuple_type",
              "jsx_element", "jsx_self_closing_element", "jsx_expression",
            },
            html = { "style_element", "script_element" },
            css = {
              "block", "arguments", "parenthesized_query",
              "feature_query", "attribute_selector",
            },
            go = {
              "parenthesized_expression", "import_spec_list",
              "field_declaration_list", "argument_list", "parameter_list",
              "type_switch_statement", "literal_value",
              "interface_type", "map_type",
            },
          },
        },
      }

      require("ibl").setup(merged)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    '';
  };
}
