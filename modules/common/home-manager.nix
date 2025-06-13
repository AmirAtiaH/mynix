{ data, homeModules, ... }:
let
  name = data.user.name or "nixer";
  stateVersion = data.user.vrsn or "25.05";
  extraHomeMods = data.extraHomeMods or [];
  extraHomePkgs = data.extraHomePkgs or [];
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPkgs = true;
    users.${name} = {
      imports = homeModules ++ data.extraHomeMods;
      extraSpecialArgs = inhert data;

      home = {
        username = name;
        homeDirectory = "/home/${name}";
        sateVersion = stateVersion;
      };

      nixpkgs.config.allowUnfree = true;
      home.Packages = extraHomePkgs;
      programs.home-manager.enable = true;
    };
  };
}
