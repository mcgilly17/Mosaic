{lib, ...}: {
  # Use lz-n for lazy loading (nixvim's recommended lazy loader)
  plugins.lz-n = {
    enable = lib.mkDefault true;
  };
}
