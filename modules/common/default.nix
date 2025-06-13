{ data, homeModules, ... }:
let
  extraCoreMods = data.extraCoreMods or [];
  extraCorePkgs = data.extraCorePkgs or [];
in {
  imports = [
    ./home-manager.nix
    ./networking.nix
    ./time-zone.nix
    ./the-user.nix
    ./locale.nix
  ] ++ extraCoreMods;
  environment.systemPackages = extraCorePkgs;
}
