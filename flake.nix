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
      imputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
  let
    datas = import ./data.nix;
    
    scanModules = mods: file:
      filter pathExists (
        map (str:
          ./modules + "/" +
          (replaceString ["."] ["/"] str) +
          "/" + file + ".nix"
        ) mods
      );

    mkConfig =
      listToAttrs (
        map ( data:
          let 
            coreModules = scanModules data.useMods "core";
            homeModules = scanModules data.useMods "home";
          in {
            ${data.host.name or "nixos"} = nixpkgs.lib.nixosSystem {
              system = data.system;
              modules = [
                ./hardware/${data.host.name or "nixos"}.nix
                ./modules/common
              ]; ++ coreModules;
              specialArgs = {
                inhert data inputs homeModules;
              };
            };
          }
        ) datas
      );
  in {
    nixosConfiguration = mkConfig
  };
}
