{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim

    rnix-lsp 
    gopls
    nodejs
    tree-sitter
    ccls
  ];

  # xdg.configFile."nvim/init.lua" = {
  #   # source = ./nvim-config;
  #   source = config.lib.file.mkOutOfStoreSymlink "nvim-config/init.lua";
  # };
}
