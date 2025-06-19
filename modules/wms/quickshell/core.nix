{
  pkgs,
  data,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${data.system}.default
    lm_sensors
    adwaita-icon-theme
    papirus-icon-theme
    ddcutil
    libdbusmenu
  ];
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}