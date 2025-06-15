{
  data,
  pkgs,
  funcs,
  ...
}:
let
  stateVersion = data.host.vrsn or "25.05";
  
  # default modules
  coreModules = funcs.scanModules data.useMods "core";

  # extra modules
  extraCoreMods = funcs.stringsToPkgs pkgs (data.extraCoreMods or []);

  # extra packages
  extraCorePkgs = funcs.stringsToPkgs pkgs (data.extraCorePkgs or []);

in {
  # common used and extra modules
  imports = [
    ./core/time-zone.nix
    ./core/the-user.nix
    ./core/locale.nix
    ./core/boot-loader.nix
  ] ++ extraCoreMods
    ++ coreModules;

  # extra packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = extraCorePkgs ++ [
    pkgs.home-manager
  ];

  system.stateVersion = stateVersion;

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
