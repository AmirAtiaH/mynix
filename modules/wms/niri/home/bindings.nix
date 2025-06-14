{ ... }:
{
  programs.niri.settings = {
    binds = {
      "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO-SINK@" "0.1+"];
      "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO-SINK@" "0.1-"];

      "mod+T".action.spawn = "kitty";
    };
  };
}
