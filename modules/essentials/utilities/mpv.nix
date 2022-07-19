{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;

    config = {
        force-window = true;
        ytdl-format = "bestvideo+bestaudio";
    };
  };
}
