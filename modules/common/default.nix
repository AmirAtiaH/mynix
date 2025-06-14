{ data, pkgs, ... }:
let
  stateVersion = data.host.vrsn or "25.05";
  
  # default modules
  scanModules = mods: file: 
    builtins.filter builtins.pathExists (
      map (str:
        # builtins.trace "./modules/${(builtins.replaceStrings ["."] ["/"] str)}/${file}.nix"
        ../${(builtins.replaceStrings ["."] ["/"] str)}/${file}.nix
      ) mods
    );


  coreModules = scanModules data.useMods "core";
  homeModules = scanModules data.useMods "home";

  # extra modules
  extraCoreMods = stringsToPkgs (data.extraCoreMods or []);
  extraHomeMods = stringsToPkgs (data.extraHomeMods or []);

  # extra packages
  stringsToPkgs = names:
    map(name: pkgs.${name}) names;

  extraCorePkgs = stringsToPkgs (data.extraCorePkgs or []);
  extraHomePkgs = stringsToPkgs (data.extraHomePkgs or []);

in {
  # common used and extra modules
  imports = [

    {
      _file = ./home-manager.nix;
    }
    #./home-manager.nix
    ./time-zone.nix
    ./the-user.nix
    ./locale.nix
    ./boot-loader.nix
  ] ++ extraCoreMods
    ++ coreModules;

  # extra packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = extraCorePkgs;

  system.stateVersion = stateVersion;

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
