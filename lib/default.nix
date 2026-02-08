{lib, ...}: {
  # Copied from Ryan4Yin and EmergentMind
  # use path relative to the root of the project
  relativeToRoot = lib.path.append ../.;
  scanPaths = path:
    builtins.map
    (f: (path + "/${f}"))
    (builtins.attrNames
      (lib.attrsets.filterAttrs
        (
          path: _type:
            (_type == "directory") # include directories
            || (
              (path != "default.nix") # ignore default.nix
              && (lib.strings.hasSuffix ".nix" path) # include .nix files
            )
        )
        (builtins.readDir path)));

  # Keymap helper functions
  # Creates a keymap with common defaults (silent = true, noremap = true)
  mkKeymap = mode: key: action: desc: {
    inherit mode key action;
    options = {
      silent = true;
      noremap = true;
      inherit desc;
    };
  };

  # Normal mode keymap
  mkNmap = key: action: desc: {
    mode = "n";
    inherit key action;
    options = {
      silent = true;
      noremap = true;
      inherit desc;
    };
  };

  # Visual mode keymap
  mkVmap = key: action: desc: {
    mode = "v";
    inherit key action;
    options = {
      silent = true;
      noremap = true;
      inherit desc;
    };
  };

  # Insert mode keymap
  mkImap = key: action: desc: {
    mode = "i";
    inherit key action;
    options = {
      silent = true;
      noremap = true;
      inherit desc;
    };
  };

  # Normal + Visual mode keymap
  mkNVmap = key: action: desc: {
    mode = ["n" "v"];
    inherit key action;
    options = {
      silent = true;
      noremap = true;
      inherit desc;
    };
  };

  # Command keymap (wraps action in <cmd>...<cr>)
  mkCmdmap = mode: key: cmd: desc: {
    inherit mode key;
    action = "<cmd>${cmd}<cr>";
    options = {
      silent = true;
      noremap = true;
      inherit desc;
    };
  };
}
