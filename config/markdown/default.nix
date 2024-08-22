{
  pkgs,
  myLibs,
  ...
}: {
  imports = myLibs.scanPaths ./.;

  extraPlugins = with pkgs.vimPlugins; [
    # add any extra makrdown specific plugins here
  ];
}
