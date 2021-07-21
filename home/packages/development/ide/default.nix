{ pkgs, ... }:

{
  imports = [
    ./vscodium.nix
  ];

  home.packages = with pkgs; [
    jetbrains.idea-ultimate     # Intellij idea
  ];

}

