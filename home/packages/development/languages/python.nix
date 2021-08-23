{ config, pkgs, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    requests
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
{
  home.packages = with pkgs; [
    python-with-my-packages
  ];
  
}
