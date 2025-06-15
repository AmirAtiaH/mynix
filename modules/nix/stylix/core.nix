{ inputs, data, pkgs, ... }:
let
  settings = data.modulesOptions.nix.stylix;
  theme = settings.theme or "gruvbox-dark-hard";
  mode = settings.mode or "dark";
  wallpaper = settings.wallpaper or "1.jpg";
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
  stylix.image = ../../../assets/images/wallpapers/${wallpaper};
  stylix.polarity = mode;
}
