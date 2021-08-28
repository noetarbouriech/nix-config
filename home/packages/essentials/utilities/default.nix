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
    xfce.thunar

    # office
    libreoffice-fresh
    hunspellDicts.en_GB-large
    hunspellDicts.en_US-large
    hunspellDicts.fr-any
    hunspellDicts.fr-moderne
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
    killall

    # xorg
    xlayoutdisplay
    xclip
    xcape
    xdotool
    xorg.xmodmap

  ];

}
