{ ... }: {
  programs.nixvim  = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
    };
    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      web-devicons.eable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          clangd.enable = true;
        };
      };
    };
  };
}
