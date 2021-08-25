{ pkgs, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        geometry = "300x5-30+50";
        frame-color = "$eceff1";
        font = "FantasqueSansMono 14";
      };

      urgency_normal = {
        background = "#37474f";
        foreground = "#eceff1";
        timeout = 10;
      };

    };

  };

}
