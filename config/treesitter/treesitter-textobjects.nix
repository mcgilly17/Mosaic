{
  pkgs,
  lib,
  config,
  ...
}: {
  plugins.treesitter-textobjects = {
    enable = lib.mkDefault true;
    settings = {
      select = {
        enable = lib.mkDefault true;
        lookahead = lib.mkDefault true;
        keymaps = {
        # Assignments
        "a=" = {
          query = "@assignment.outer";
          desc = "Select outer part of assignment";
        };
        "i=" = {
          query = "@assignment.inner";
          desc = "Select inner part of assignment";
        };
        "l=" = {
          query = "@assignment.lhs";
          desc = "Select left hand side of assignment";
        };
        "r=" = {
          query = "@assignment.rhs";
          desc = "Select right hand side of assignment";
        };

        # Properties
        "a:" = {
          query = "@property.outer";
          desc = "Select outer part of an object property";
        };
        "i:" = {
          query = "@property.inner";
          desc = "Select inner part of an object property";
        };
        "l:" = {
          query = "@property.lhs";
          desc = "Select left part of an object property";
        };
        "r:" = {
          query = "@property.rhs";
          desc = "Select right part of an object property";
        };

        # Arguments
        "aa" = {
          query = "@parameter.outer";
          desc = "Select outer part of a parameter/argument";
        };
        "ia" = {
          query = "@parameter.inner";
          desc = "Select inner part of a parameter/argument";
        };

        # Conditionals
        "ai" = {
          query = "@conditional.outer";
          desc = "Select outer part of a conditional";
        };
        "ii" = {
          query = "@conditional.inner";
          desc = "Select inner part of a conditional";
        };

        # Loops
        "al" = {
          query = "@loop.outer";
          desc = "Select outer part of a loop";
        };
        "il" = {
          query = "@loop.inner";
          desc = "Select inner part of a loop";
        };

        # Function calls
        "af" = {
          query = "@call.outer";
          desc = "Select outer part of a function call";
        };
        "if" = {
          query = "@call.inner";
          desc = "Select inner part of a function call";
        };

        # Methods definitions
        "am" = {
          query = "@function.outer";
          desc = "Select outer part of a method/function definition";
        };
        "im" = {
          query = "@function.inner";
          desc = "Select inner part of a method/function definition";
        };

        # Classes
        "ac" = {
          query = "@class.outer";
          desc = "Select outer part of a class";
        };
        "ic" = {
          query = "@class.inner";
          desc = "Select inner part of a class";
        };

        # Comments
        "aco" = {
          query = "@comment.outer";
          desc = "Select outer part of a Comment";
        };
        };
      };
      move = {
        enable = lib.mkDefault true;
        set_jumps = lib.mkDefault true; # whether to set jumps in the jumplist
        goto_next_start = {
        "]f" = {
          query = "@call.outer";
          desc = "Next function call start";
        };
        "]=" = {
          query = "@assignment.outer";
          desc = "Next assignement start";
        };
        "]m" = {
          query = "@function.outer";
          desc = "Next method/function def start";
        };
        "]c" = {
          query = "@class.outer";
          desc = "Next class start";
        };
        "]i" = {
          query = "@conditional.outer";
          desc = "Next conditional start";
        };
        "]l" = {
          query = "@loop.outer";
          desc = "Next loop start";
        };
        };
        goto_next_end = {
        "]F" = {
          query = "@call.outer";
          desc = "Next function call end";
        };
        "]M" = {
          query = "@function.outer";
          desc = "Next method/function def end";
        };
        "]C" = {
          query = "@class.outer";
          desc = "Next class end";
        };
        "]I" = {
          query = "@conditional.outer";
          desc = "Next conditional end";
        };
        "]L" = {
          query = "@loop.outer";
          desc = "Next loop end";
        };
        };
        goto_previous_start = {
        "[f" = {
          query = "@call.outer";
          desc = "Prev function call start";
        };
        "[=" = {
          query = "@assignment.outer";
          desc = "Prev assignement start";
        };
        "[m" = {
          query = "@function.outer";
          desc = "Prev method/function def start";
        };
        "[c" = {
          query = "@class.outer";
          desc = "Prev class start";
        };
        "[i" = {
          query = "@conditional.outer";
          desc = "Prev conditional start";
        };
        "[l" = {
          query = "@loop.outer";
          desc = "Prev loop start";
        };
        };
        goto_previous_end = {
        "[F" = {
          query = "@call.outer";
          desc = "Prev function call end";
        };
        "[M" = {
          query = "@function.outer";
          desc = "Prev method/function def end";
        };
        "[C" = {
          query = "@class.outer";
          desc = "Prev class end";
        };
        "[I" = {
          query = "@conditional.outer";
          desc = "Prev conditional end";
        };
        "[L" = {
          query = "@loop.outer";
          desc = "Prev loop end";
        };
        };
      };
      swap = {
        enable = lib.mkDefault true;
        swap_next = {
          "<leader>cSna" = "@parameter.inner"; # swap parameters/argument with next
          "<leader>cSn:" = "@property.outer"; # swap object property with next
          "<leader>cSnm" = "@function.outer"; # swap function with next
        };
        swap_previous = {
          "<leader>cSpa" = "@parameter.inner"; # swap parameters/argument with prev
          "<leader>cSp:" = "@property.outer"; # swap object property with prev
          "<leader>cSpm" = "@function.outer"; # swap function with previous
        };
      };
    };
  };

  plugins.which-key.settings.spec = lib.optionals config.plugins.treesitter-textobjects.enable [
    # Code Configs
    {
      __unkeyed-1 = "<leader>cS";
      mode = [
        "n"
      ];
      group = "+swap";
    }
    {
      __unkeyed-1 = "<leader>cSn";
      mode = [
        "n"
      ];
      group = "+next";
    }
    {
      __unkeyed-1 = "<leader>cSp";
      mode = [
        "n"
      ];
      group = "+previous";
    }
  ];
}
