{pkgs, lib, ...}: {
  plugins.todo-comments = {
    enable = lib.mkDefault true;
  };
}
