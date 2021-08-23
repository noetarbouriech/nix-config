{ config, pkgs, ... }:

{
  imports = [
    ./go.nix
    ./java.nix
    ./python.nix
  ];
}
