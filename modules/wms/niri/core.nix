{ inputs, pkgs, ... }: {
  imports = [
    #./core/keyring.nix
    ./core/portal.nix
  ];
  programs.niri.enable = true;
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri.package = pkgs.niri;

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
  ];
}
