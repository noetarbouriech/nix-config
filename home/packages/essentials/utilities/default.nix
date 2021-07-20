{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./starship.nix
    ./mpv.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    # password manager
    bitwarden

    # file
    ranger

    # office
    libreoffice-fresh
    obsidian
    zotero
    zathura

    # communication
    discord
    signal-desktop
    mailspring

    # image
    feh
    inkscape
    gimp

    # video
    obs-studio

    # terminal
    fzf
    tmux

  ];

}
