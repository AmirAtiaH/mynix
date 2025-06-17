{ config, lib, pkgs, ... }:{
  services.xserver.enable = false;

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
  ];

  services.xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  security.polkit.enable = true;
  services.dbus.enable = true;
}
