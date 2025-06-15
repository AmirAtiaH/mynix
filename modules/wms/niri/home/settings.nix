{
  lib,
  pkgs,
  config,
  ...
}:
{
  programs.niri.settings = {
    environment = {
      CLUTTER_BACKEND = "wayland";
      DISPLAY = ":0";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      TERM = "kitty";
      TERMINAL = "kitty";
      XMODIFIERS = "@im=fcitx";
    };


    input = {
      keyboard = {
        xkb.layout = "us,ara";
        #numlock = true;
      };
      power-key-handling.enable = true;
      warp-mouse-to-focus = false;
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };
    };


    layout = {
      gaps = 16;
      border.width = 5;
      always-center-single-column = true;
      empty-workspace-above-first = true;
      default-column-width.proportion = 1. / 3.;
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
        # { fixed = 1920; }
      ];
      focus-ring = {
        enable = true;
        width = 6;
        active = "rgb(127 200 255)";
      };
    };


    spawn-at-startup =
    let
      command = cmd: { command = lib.lists.flatten [ cmd ]; };
    in
    [
      (command (lib.getExe pkgs.xwayland-satellite))
      (command (lib.getExe pkgs.waybar))
      (command [
        (lib.getExe pkgs.mako)
        "--default-timeout"
        "20000"
      ])
      (command (lib.getExe pkgs.polkit_gnome))
    ];

    screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";
  };
}
