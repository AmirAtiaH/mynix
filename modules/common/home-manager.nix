{ 
  data,
  homeModules,
  extraHomeMods,
  extraHomePkgs,
  ...
}:
let
  name = data.user.name or "nixer";
  stateVersion = data.user.vrsn or "25.05";
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPkgs = true;
    users.${name} = {
      imports = homeModules ++ extraHomeMods;
      extraSpecialArgs = {
        inherit data;
      };

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
    };
  };
}
