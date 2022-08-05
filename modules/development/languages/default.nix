{ config, pkgs, ... }:

{
  imports = [
    ./go.nix
    ./java.nix
    ./python.nix
    ./php.nix
    ./rust.nix
  ];
}
