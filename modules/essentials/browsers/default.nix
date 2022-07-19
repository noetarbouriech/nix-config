{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./ungoogled-chromium.nix
  ];
}
