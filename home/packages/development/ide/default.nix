{ pkgs, ... }:

{
  imports = [
    ./vscodium.nix
    ./intellij.nix
  ];

  home.packages = with pkgs; [
    neovide
  ];

}

