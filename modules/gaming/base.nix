{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lutris
    polymc
  ];

}

