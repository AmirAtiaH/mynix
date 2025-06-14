{ data, pkgs, ... }:
let
  name = data.user.name or "nixer";
in {
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "testdb" ];
    ensureUsers = [
      {
        name = name;
      }
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      # TYPE  DATABASE        USER            METHOD
      local   all             all             trust
      host    all             all   127.0.0.1/32    trust
      host    all             all   ::1/128        trust
    '';
  };
}
