{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    plugins = with pkgs; [
      rofi-calc
    ];

    borderWidth = 0;
    font = "FantasqueSansMono 14";

  };
}
