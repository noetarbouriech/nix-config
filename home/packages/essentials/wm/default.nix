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
      feh --bg-scale ~/pics/wall.png &
    '';
    # current wallpaper: https://www.microsoft.com/en-us/microsoft-365/blog/uploads/prod/sites/2/2021/06/Msft_Nostalgia_Solitaire.jpg

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
    # (import ./bwall.nix) # use too much power
  ];


}
