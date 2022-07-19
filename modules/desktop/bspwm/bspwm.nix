{ config, pkgs, ... }:

{
  xsession = {
    windowManager.bspwm = {
      enable = true;

      monitors = { 
        "eDP" = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ]; 
      };

      settings = {
        border_width = 2;
        window_gap = 6;

        split-ratio = 0.50;
        borderless_monocle = true;
        gapless_monocle = true;
        focus_follows_pointer = true;
      };

      rules = {
        "Gimp" = {
          state = "floating";
          follow = true;
        };
        "Discord" = { desktop = "^1"; };
      };
    };
  };
}
