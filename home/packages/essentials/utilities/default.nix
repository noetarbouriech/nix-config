{ pkgs, ... }:

let
  unstableConf = { allowUnfree = true; };
  unstable = import <unstable> { config = unstableConf; };
in
{
  imports = [
    ./alacritty.nix
    ./urxvt.nix

    ./fish.nix
    ./starship.nix
    ./git.nix
    ./tmux.nix
    ./ssh.nix

    ./mpv.nix
    # ./dunst.nix broken
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
    unstable.obsidian
    neuron-notes
    zotero
    zathura
    hplipWithPlugin

    # communication
    unstable.discord
    signal-desktop
    thunderbird
    slack

    # image
    feh
    inkscape
    gimp

    # video
    obs-studio

    # fun
    cowsay 

    # terminal
    fzf
    silicon
    glow
    gotop
    ncdu
    ripgrep

    # utilities
    scrot
    gcc
    lm_sensors
    killall

    texlive.combined.scheme-full

    # xorg
    xlayoutdisplay
    xclip
    xcape
    xdotool
    xorg.xmodmap

  ];

}
