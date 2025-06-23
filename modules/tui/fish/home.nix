{ data, pkgs, ... }:
let
  host = data.host.name or "nixos";
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      nix-delete = ''
        sudo nix-env --delete-generations +3
        sudo nix-collect-garbage -d
      '';
      nix-switch = ''
        sudo nixos-rebuild switch --flake .#${host}
      '';
      nix-update = ''
        nix flake update
        nix-switch
      '';
    };
  };
}
