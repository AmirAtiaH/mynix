{
  pkgs,
  funcs,
  data,
  ...
}:
let
  # extra packages
  # programs.vscode.
  extensions = funcs.stringsToPkgs pkgs.vscode-extensions (data.options.dev.vscode.extensions or []);
in {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = extensions;
  };
}
