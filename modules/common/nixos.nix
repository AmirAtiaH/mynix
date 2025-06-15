{
  data,
  pkgs,
  func,
  ...
}:
let
  stateVersion = data.host.vrsn or "25.05";
  
  # default modules
  coreModules = func.scanModules data.useMods "core";

  # extra modules
  extraCoreMods = func.stringsToPkgs "" (data.extraCoreMods or []);

  # extra packages
  extraCorePkgs = func.stringsToPkgs "" (data.extraCorePkgs or []);

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
    home-manager
  ];

  system.stateVersion = stateVersion;

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
