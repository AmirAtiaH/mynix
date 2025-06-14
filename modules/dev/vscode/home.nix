{ pkgs, ... }:
let
  # extra packages
  stringsToPkgs = names:
    map(name: pkgs.vscode-extensions.${name}) names;

  extensions = stringsToPkgs data.modulesOptions.dev.vscode.extensions or [];
in {
  programs.vscode = {
    enable = true;
    extensions = extensions;
  };
}
