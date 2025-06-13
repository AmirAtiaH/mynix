{ pkgs, ... }:
let
  extensions = data.modulesOptions.dev.vscode.extensions or [];
in {
  programs.vscode = {
    enable = true;
    extensions = extensions;
  };
}
