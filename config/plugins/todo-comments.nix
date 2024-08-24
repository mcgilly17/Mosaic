{pkgs, ...}: {
  plugins.todo-comments = {
    enable = pkgs.lib.mkDefault true;
  };
}
