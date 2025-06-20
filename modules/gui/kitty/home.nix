{ lib, ... }:
{
  programs.kitty = lib.mkDefault{
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = false;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      #background_opacity = "0.5";
      #background_blur = 10;
    };
  };
}