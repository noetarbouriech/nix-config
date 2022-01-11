{ pkgs, ... }:

let
  unstable = import <unstable> { };
in
{
  home.packages = with pkgs; [
    aseprite      # pixel art editor
    unstable.godot         # game engine
  ];

}

