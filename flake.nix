{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs :
  let
    datas = import ./data.nix;
    
    scanModules = mods: file:
      builtins.filter builtins.pathExists (
        map (str:
          ./modules + "/" +
          (builtins.replaceStrings ["."] ["/"] str) +
          "/" + file + ".nix"
        ) mods
      );

    mkConfig =
      builtins.listToAttrs (
        map ( data:
          let 
            coreModules = scanModules data.useMods "core";
            homeModules = scanModules data.useMods "home";
          in {
            name = (data.host or {}).name or "nixos";
            value = nixpkgs.lib.nixosSystem {
              system = data.system;
              modules = [
                ./hardware/${(data.host or {}).name or "nixos"}.nix
                ./modules/common
              ] ++ coreModules;
              specialArgs = {
                inherit inputs data homeModules;
              };
            };
          }
        ) datas
      );
  in {
    nixosConfigurations = mkConfig;
  };
}
