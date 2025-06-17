{ pkgs, ... }: {
  scanModules = mods: file: 
    builtins.filter builtins.pathExists (
      map (str:
        # builtins.trace "./modules/${(builtins.replaceStrings ["."] ["/"] str)}/${file}.nix"
        ../${(builtins.replaceStrings ["."] ["/"] str)}/${file}.nix
      ) mods
    );
    
  stringsToPkg = place: path:
    builtins.foldl' (s: key: s.${key}) place path;
    
  stringsToPkgs = place: paths:
    map (path: builtins.foldl' (s: key: s.${key}) place path) paths;
}