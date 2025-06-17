{ inputs, data, pkgs, ... }:
let
  settings = data.options.nix.stylix;
  theme = settings.theme or "gruvbox-dark-hard";
  mode = settings.mode or "dark";
  wallpaper = settings.wallpaper or "1.jpg";
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
    image = ../../../assets/images/wallpapers/${wallpaper};
    polarity = mode;
  };
}
