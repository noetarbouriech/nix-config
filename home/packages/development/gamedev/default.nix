{ pkgs, ... }:

{
  imports = [
    ./godot.nix
  ];

  home.packages = with pkgs; [
    aseprite      # pixel art editor
    godot         # game engine
  ];

}

