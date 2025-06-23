{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    nix-ld.libraries = with pkgs; [
      libtool
      xorg.libX11
      xorg.libXcursor
      xorg.libxcb
      xorg.libXi
      xorg.libXext
      xorg.libXinerama
      xorg.libXrandr
      alsa-lib
      libpulseaudio
      fontconfig
      harfbuzz
      freetype
      libGL
      libvlc
      libvlcpp
      glibc
      libxcrypt-legacy
      openssl_1_1
      xorg.libxcb
      xorg.libxcb.dev
    ];
  };
}