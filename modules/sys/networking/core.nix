{ data, ... }:
let
  host = data.host.name or "nixos";
in {
  networking.networkmanager.enable = true;
  networking.hostName = host;
}
