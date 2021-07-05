{ config, pkgs, ... }:

{
  imports = [
    ./bspwm.nix
    ./sxhkd.nix
    ./polybar.nix
    ./rofi.nix
  ];

  xsession = {
    enable = true;

    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
    };

    profileExtra = ''
      xset r rate 280 70 &
      nm-applet &
    '';

  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.vimix-gtk-themes;
      name = "vimix-laptop-doder";
    };
  };

  home.packages = with pkgs; [
    networkmanagerapplet
  ];

}
