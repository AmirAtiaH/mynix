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
    funcs = import ./modules/common/funcs.nix;
    datas = import ./data.nix;


    mkCore =
      builtins.listToAttrs (
        map ( data: {
            name = (data.host or {}).name or "nixos";
            value = nixpkgs.lib.nixosSystem {
              system = data.system;
              modules = [
                ./hardware/${data.host.name or "nixos"}.nix
                ./modules/common/nixos.nix
              ];
              specialArgs = {
                inherit inputs data funcs;
              };
            };
          }
        ) datas
      );


    mkHome =
      builtins.listToAttrs (
        map (data: {
          name = "${data.host.name}.${data.user.name}";
          value = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${data.system};
            useGlobalPkgs = true;
            useUserPkgs = true;
            extraSpecialArgs = {
              inherit inputs data funcs;
            };
            modules = [
              ./modules/common/home-manager.nix
            ];
          };
        }) datas
      );
  in {
    nixosConfigurations = mkCore;
    homeConfigurations = mkHome;
  };
}
