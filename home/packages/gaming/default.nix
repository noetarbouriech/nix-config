{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lutris
    steam
    multimc
  ];

  programs.steam.enable = true;

}

