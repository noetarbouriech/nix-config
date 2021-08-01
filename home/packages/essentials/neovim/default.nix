{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs.neovim = { 
    enable = true;
    package = pkgs.neovim-nightly;
    
    # extraConfig = builtins.readFile ./config.vim; # doesn't work

    configure = {
      customRC = builtins.readFile ./config.vim;
    };

    plugins = with pkgs.vimPlugins; [
      fugitive
      nord-vim
      vim-commentary
      lualine-nvim
      vim-devicons
    ];
  };

}
