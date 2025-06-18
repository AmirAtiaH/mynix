[
  {
    useMods = [
      # done
      "sys.common"
      # "sys.kernel"
      # "sys.bluetooth"
      # "sys.networking"
      # "sys.pipewire"
      "sys.nvidia"

      "nix.stylix"

      "wms.niri"
      "kit.waybar"
      "kit.kitty"
      "kit.mpv"
      "kit.nautilus"
      "kit.oculante"

      "tui.git-utils"
      "tui.fish"
      "tui.nushell"

      "dev.postgre"
      "dev.dbeaver"
      "dev.dotnet"
      "dev.vscode"
      "dev.c"

      "gui.zen"
      "gui.vesktop"
      "gui.dino"
      "gui.telegram"

      "fun.steam"
      "fun.gamemode"

      # working on
      "dev.nixvim"
      # "tui.fastfetch"
      # "gui.element"
      "tui.starship"
      # "nix.generator"
      # "tui.yazi"
    ];

    # not moduled system pkgs
    extraCorePkgs = [
      # ["hyprland"]
      ["fastfetch"]
      ["ghostty"]
    ];

    # not moduled user pkgs
    extraHomePkgs = [
      # ["discord"]
      ["element-desktop"]
    ];

    # extra nixos modules
    extraCoreMods = [
      # ./path/to/the/module.nix
    ];

    # extra home manager modules
    extraHomeMods = [
      # ./path/to/the/module.nix
    ];

    system = "x86_64-linux";
    timeZone = "Africa/Cairo";
    language = "en_US.UTF-8";
    shell = ["fish"];

    host = {
      name = "pixel";
      vrsn = "25.05";
    };

    user = {
      name = "ameer";
      info = "AmirAttia";
    };
    
    options = {
      tui.git-utils = {
        name = "AmirAtiaH";
        mail = "amir.gppume@gmail.com";
      };
      nix.stylix = {
        colorScheme = "tokyo-night-dark";
        mode = "dark";
        wallpaper = "1.jpg";
      };
      dev.vscode = {
        extensions = [
          ["ms-dotnettools" "csdevkit"]
          ["yzhang" "markdown-all-in-one"]
        ];
      };
    };
  }
]
