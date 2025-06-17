{ lib, ... }: {
  #services.gnome.gnome-keyring.enable = true;
  #services.gnome.gnome-keyring.enable = lib.mkForce false;
  #security.pam.services.login.enableGnomeKeyring = true;
}