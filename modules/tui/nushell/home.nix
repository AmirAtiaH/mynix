{ data, pkgs, ... }:
let
  name = data.user.name or "nixer";
in {
  programs.nushell = {
    extraConfig = ''
      let carapace_completer = { |spans|
        carapace $spans.0 nushell ...$ | from json
      }
      $env.config = {
        show_banner: false,
        completions: {
          case_sensitive: false
          quick: true
          partial: true
          algorithm: "fuzzy"
          external: {
            enable: true
            max_results: 100
            completer: $carapace_completer
          }
        }
      }
      $env.PATH = ($end.PATH |
        split row (char esep) |
        prepend /home/${name}/.apps |
        append /usr/bin/env
      )
    '';
  };
  programs.carapace.enable = true;
  programs.carapace.enableNushellintegration = true;
}
