{ data, ... }:
let
  name = data.user.name or "nixer";
  info = data.user.info or "TheUser";
in {
  users.users.${name} = {
    isNormalUser = true;
    description = info;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
