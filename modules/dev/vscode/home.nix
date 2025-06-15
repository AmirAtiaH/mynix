{
  pkgs,
  funcs,
  ...
}:
let
  # extra packages
  extensions = funcs.stringsToPkgs "" data.modulesOptions.dev.vscode.extensions or [];
in {
  programs.vscode = {
    enable = true;
    extensions = extensions;
  };
}
