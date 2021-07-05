{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window.padding = {
        x = 6;
        y = 6;
      };

      font = {
        normal = {
          family = "FantasqueSansMono Nerd Font";
	  style = "Regular";
        };
	size = 8.0;
      };

    };

  };

}
