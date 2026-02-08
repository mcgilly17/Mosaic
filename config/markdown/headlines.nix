{pkgs, lib, ...}: {
  plugins.headlines = {
    enable = lib.mkDefault true;
    settings = lib.mkDefault {
      markdown = {
        headline_highlights = [
          "Headline1"
          "Headline2"
          "Headline3"
          "Headline4"
          "Headline5"
          "Headline6"
        ];
        bullets = ["󰎤" "󰎧" "󰎪" "󰎭" "󰎱" "󰎳"];
      };
    };
  };
}
