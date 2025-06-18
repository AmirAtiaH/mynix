{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    libsecret
    xwayland-satellite
    mako
    brightnessctl
    swaybg
    swaylock
    fuzzel
    nautilus
  ];
}
