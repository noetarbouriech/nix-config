{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./urxvt.nix

    ./fish.nix
    ./starship.nix
    ./git.nix
    ./tmux.nix

    ./mpv.nix
    ./dunst.nix
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
    silicon
    glow
    gotop
    ncdu

    # utilities
    scrot
    gcc
    lm_sensors

    # xorg
    xlayoutdisplay
    xclip

  ];

}
