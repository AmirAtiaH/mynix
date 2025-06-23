{ 
  data,
  funcs,
  pkgs,
  ...
}:
let
  name = data.user.name or "nixer";
  stateVersion = data.user.vrsn or "25.05";
  
  # default modules
  homeModules = funcs.scanModules data.useMods "home";

  # extra modules
  extraHomeMods = funcs.stringsToPkgs pkgs (data.extraHomeMods or []);

  # extra packages
  extraHomePkgs = funcs.stringsToPkgs pkgs (data.extraHomePkgs or []);
in {
  imports = homeModules ++ extraHomeMods;

  home = {
    username = name;
    homeDirectory = "/home/${name}";
    stateVersion = stateVersion;
  };

  home.sessionVariables = {
    PATH = "$PATH:/home/${name}/v";
  };
  
  # allow unfree packages and use extra packages
  nixpkgs.config.allowUnfree = true;
  home.packages = extraHomePkgs;

  # enable home manager
  programs.home-manager.enable = true;
}
