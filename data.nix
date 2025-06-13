{ pkgs, ... }
[
  {
    useMods = [
      "os.common"
      # "os.kernel"
      # "os.bluetooth"
      # "os.networking"
      # "os.pipewire"
      "os.nvidia"

      "nix.stylix"
      "nix.generator"

      "ui.niri"

      "cli.git-utils"
      "cli.fish"
      "cli.nushell"

      "dev.postgre"
      "dev.dbeaver"
      "dev.dotnet"
      "dev.nixvim"
      "dev.vscode"
      "dev.c"

      "apps.kitty"
      "apps.vesktop"
      "apps.dino"
      "apps.telegram"
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
      kit.git-utils = {
        name = "AmirAtiaH";
        mail = "amir.gppume@gmail.com";
      };
      theme.stylix = {
        colorScheme = "gruvbox-dark-hard"
        mode = "dark";
        wallpaper = "1.jpg";
      };
    };
  }
]
