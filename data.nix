{ pkgs, ... }
[
  {
    useMods = [
      "sys.common"
      # "sys.kernel"
      # "sys.bluetooth"
      # "sys.networking"
      # "sys.pipewire"
      "sys.nvidia"

      "nix.stylix"
      "nix.generator"

      "wms.niri"

      "tui.git-utils"
      "tui.fish"
      "tui.nushell"

      "dev.postgre"
      "dev.dbeaver"
      "dev.dotnet"
      "dev.nixvim"
      "dev.vscode"
      "dev.c"

      "gui.kitty"
      "gui.vesktop"
      "gui.dino"
      "gui.telegram"
    ];

    # not moduled system pkgs
    extraCorePkgs = with pkgs; [
      # hyprland
    ];

    # not moduled user pkgs
    extraHomePkgs = with pkgs; [
      # discord
    ];

    # extra nixos modules
    extraCoreMods = with pkgs; [
      # ./path/to/the/module.nix
    ];

    # extra home manager modules
    extraHomeMods = with pkgs; [
      # ./path/to/the/module.nix
    ];

    system = "x86_64-linux";
    timeZone = "Africa/Cairo";
    language = "en_US.UTF-8";

    host = {
      name = "pixel";
      vrsn = "25.05";
    };

    user = {
      name = "ameer";
      info = "AmirAttia";
    };

    modulesOptions = {
      tui.git-utils = {
        name = "AmirAtiaH";
        mail = "amir.gppume@gmail.com";
      };
      nix.stylix = {
        colorScheme = "gruvbox-dark-hard"
        mode = "dark";
        wallpaper = "1.jpg";
      };
      dev.vscode = {
        extensions = with pkgs.vscode-extensions; [
          ms-dotnettools.csdevkit
          yzhang.markdown-all-in-one
        ];
      };
    };
  }
]
