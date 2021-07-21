{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pythonFull
  ];
  
}
