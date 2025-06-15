{ 
  data,
  funcs,
  ...
}:
let
  name = data.user.name or "nixer";
  stateVersion = data.user.vrsn or "25.05";
  
  # default modules
  homeModules = func.scanModules data.useMods "home";

  # extra modules
  extraHomeMods = func.stringsToPkgs "" (data.extraHomeMods or []);

  # extra packages
  extraHomePkgs = func.stringsToPkgs "" (data.extraHomePkgs or []);
in {
  imports = homeModules ++ extraHomeMods;

  home = {
    username = name;
    homeDirectory = "/home/${name}";
    sateVersion = stateVersion;
  };

  # allow unfree packages and use extra packages
  nixpkgs.config.allowUnfree = true;
  home.Packages = extraHomePkgs;

  # enable home manager
  programs.home-manager.enable = true;
}
