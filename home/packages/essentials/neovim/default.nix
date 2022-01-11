{ pkgs, ... }:

let
  nord-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "nord-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "shaunsingh";
      repo = "nord.nvim";
      rev = "d2b6f9d4688a381f26a652df7e1b6a49e9f33542";
      sha256 = "03jjx1mblqwdrz7g280wvdyq9sbfj6spf8k61gcq1gy7bb4qjfp7";
    };
  };
  unstableConf = { allowUnfree = true; };
  unstable = import <unstable> { config = unstableConf; };
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.packages = with pkgs; [
    rnix-lsp # doesn't work in autocomplete
    gopls
    nodejs
    tree-sitter
    ccls # C LSP
  ];

  programs.neovim = { 
    enable = true;
    package = pkgs.neovim-nightly;
    
    # extraConfig = builtins.readFile ./config.vim; # broken

    configure = {
      customRC = builtins.readFile ./config.vim;
    };

    plugins = with pkgs.vimPlugins; [
      # colorscheme
      zenburn 
      seoul256-vim
      gruvbox
      solarized
      nord-nvim

      # fancy stuff
      vim-devicons
      nvim-treesitter

      # utils
      vim-commentary
      lualine-nvim
      nvim-toggleterm-lua

      # lsp
      nvim-lspconfig
      vim-nix

      # autocomplete
      nvim-compe
    ];

  };

}
