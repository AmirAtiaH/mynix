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
      "wms.waybar"

      "tui.git-utils"
      "tui.fish"
      "tui.nushell"

      "dev.postgre"
      "dev.dbeaver"
      "dev.dotnet"
      "dev.vscode"
      "dev.c"
      "dev.nixvim"

      "gui.zen"
      "gui.kitty"
      "gui.mpv"
      "gui.oculante"

      "fun.steam"
      "fun.gamemode"

      # working on
      # "tui.fastfetch"
      # "tui.starship"
      # "nix.generator"
      # "tui.yazi"
    ];

    # not moduled system pkgs
    extraCorePkgs = [
      ["fastfetch"]
      ["ghostty"]
    ];

    # not moduled user pkgs
    extraHomePkgs = [
      ["element-desktop"]
      ["dino"]
      ["telegram-desktop"]
      ["vesktop"]
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
