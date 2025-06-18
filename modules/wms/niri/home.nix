{ inputs, pkgs, lib, config, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./home/settings.nix
    ./home/bindings.nix
    ./home/dconf.nix
  ];
}
