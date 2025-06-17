{
  data,
  pkgs,
  funcs,
  ...
}:
let
  terminal = funcs.stringsToPkg pkgs (data.shell or ["fish"]);
in {
  users.defaultUserShell = terminal;
}