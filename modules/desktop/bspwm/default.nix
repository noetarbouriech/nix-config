{ config, pkgs, ... }:

{
  imports = [
    ./x11.nix
    ./bspwm.nix
    ./sxhkd.nix
    ./polybar.nix
    ./rofi.nix
    # ./dunst.nix broken
  ];

  xsession = {
    enable = true;

    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
    };

    profileExtra = ''
      nm-applet &
      xset r rate 280 70 &
      feh --bg-scale ~/pics/wall.png &
    '';
    # current wallpaper: https://www.microsoft.com/en-us/microsoft-365/blog/uploads/prod/sites/2/2021/06/Msft_Nostalgia_Solitaire.jpg
  };

  services.xcape = {
    enable = true;
    mapExpression = { Super_L = "Escape"; };
  };

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.vimix-gtk-themes;
      name = "vimix-laptop-doder";
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };
  };

  home.packages = with pkgs; [
    networkmanagerapplet lightlocker
    # (import ./bwall.nix) # uses too much power
  ];
}
