{
  pkgs,
  funcs,
  data,
  ...
}:
let
  extensions-pkgs = funcs.stringsToPkgs pkgs.vscode-extensions (data.options.dev.vscode.extensions or []);
in {
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      extensions = extensions-pkgs;
      userSettings = {
        "files.autoSave" = "afterDelay";
        "[nix]"."editor.tabSize" = 2;
      };
    };
  };
}