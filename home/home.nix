{ config, pkgs, ... }:

{
  imports = (import ./current.nix) ++ (import ./packages/essentials);

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  
  # mute home-manager news
  news.display = "silent";

  home = {
    # Current stable version for Home Manager
    stateVersion = "21.05";
    enableNixpkgsReleaseCheck = false;

    keyboard = {
      layout = "us";
      variant = "intl";
      options = [ "caps:super" ];
    };

    username = "noe";
    homeDirectory = "/home/noe";

    packages = with pkgs; [
      xdg_utils       # utils
    ];
  };

  xdg = {
    enable = true;

    userDirs = {
      enable = true;

      download = "\$HOME/dl";
      desktop = "\$HOME";
      documents = "\$HOME/docs";
      music = "\$HOME/";
      pictures = "\$HOME/pics";
      templates = "\$HOME";
      videos = "\$HOME/vids";
    };
  };

}
