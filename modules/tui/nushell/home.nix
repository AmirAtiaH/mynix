{ data, pkgs, ... }:
let
  name = data.user.name or "nixer";
  host = data.host.name or "nixos";
in {
  /*programs.nushell = {
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
  programs.carapace.enableNushellintegration = true;*/

  programs = {
    nushell = { enable = true;
    extraConfig = ''
      let carapace_completer = {|spans|
      carapace $spans.0 nushell ...$spans | from json
      }
      $env.config = {
      show_banner: false,
      completions: {
      case_sensitive: false # case-sensitive completions
      quick: true    # set to false to prevent auto-selecting completions
      partial: true    # set to false to prevent partial filling of the prompt
      algorithm: "fuzzy"    # prefix or fuzzy
      external: {
      # set to false to prevent nushell looking into $env.PATH to find more suggestions
          enable: true 
      # set to lower can improve completion performance at the cost of omitting some options
          max_results: 100 
          completer: $carapace_completer # check 'carapace_completer' 
        }
      }
      } 
      $env.PATH = ($env.PATH | 
      split row (char esep) |
      prepend /home/${name}/.apps |
      append /usr/bin/env
      )
      '';
      /*shellAliases = {
        nix-delete = ''
          sudo nix-env --delete-generations +3
          sudo nix-collect-garbage -d
        '';
        nix-switch = ''
          sudo nixos-rebuild switch --flake .#${host}
        '';
        nix-update = ''
          sudo nix flake update .
          nix-switch
        '';
      };*/
    };  
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
  };
}
