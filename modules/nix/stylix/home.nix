{ inputs, data, pkgs, ... }:
let
  settings = data.options.nix.stylix;
  colorScheme = settings.colorScheme or "gruvbox-dark-hard";
  mode = settings.mode or "dark";
  wallpaper = settings.wallpaper or "1.jpg";
in {
  imports = [
    inputs.stylix.homeModules.stylix
  ];
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${colorScheme}.yaml";
    image = ../../../assets/images/wallpapers/${wallpaper};
    polarity = mode;

    fonts = {
      sizes.terminal = 12;
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
    /*iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
    };*/
    iconTheme = {
      enable = true;
      package = pkgs.material-symbols;
      light = "Material Symbols Light";
      dark = "Material Symbols Dark";
    };
  };
}
