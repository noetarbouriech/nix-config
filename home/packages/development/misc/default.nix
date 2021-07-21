{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ansible vagrant 
  ];

}

