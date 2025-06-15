{ pkgs, ... }: {
  scanModules = mods: file: 
    builtins.filter builtins.pathExists (
      map (str:
        # builtins.trace "./modules/${(builtins.replaceStrings ["."] ["/"] str)}/${file}.nix"
        ../${(builtins.replaceStrings ["."] ["/"] str)}/${file}.nix
      ) mods
    );
  
  stringsToPkgs = place: names:
    map(name: pkgs.${place + name}) names;
}