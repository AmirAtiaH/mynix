{ config, lib, pkgs, ... }:{
  environment.systemPackages = with pkgs; [
    waybar
  ];
  
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-wlr
    ];
  };
  security.polkit.enable = true;
  services.dbus.enable = true;
}