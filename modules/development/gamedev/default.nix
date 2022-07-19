{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aseprite      # pixel art editor
    godot         # game engine
  ];
}
