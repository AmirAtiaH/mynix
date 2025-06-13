{ data, pkgs, ... }:
let
  settings = data.modulesOptions.nix.stylix;
  theme = settings.theme or "gruvbox-dark-hard";
  mode = settings.mode or "dark";
  wallpaper = settings.wallpaper or "1.jpg";
in {
  stylix.enable = true;
  stylix.base16Scheme = "${pkg.base16-schemes}/share/themes/${theme}.taml";
  stylix.image = ../../../assets/images/wallpaper/${wallpaper};
  stylix.polarity = mode;
}
