{ config, pkgs, user, ... }:

{
  imports = (import ../modules/essentials);

  programs.home-manager.enable = true;
  
  # Mute home-manager news
  news.display = "silent";

  home = {
    # Current stable version for Home Manager
    stateVersion = "22.05";
    enableNixpkgsReleaseCheck = false;

    keyboard = {
      layout = "us";
      variant = "intl";
      options = [ "caps:super" ];
    };

    # Replace ć with ç on keyboard
    sessionVariables = {
      GTK_IM_MODULE = "cedilla";
      QT_IM_MODULE = "cedilla";
    };
    file.".XCompose".text = ''
      include "%L"
      <dead_acute><C> : "Ç"
      <dead_acute><c> : "ç"
    '';

    username = "${user}";
    homeDirectory = "/home/${user}";
    sessionPath = [ "$HOME/bin" "$HOME/go/bin" ];

    packages = with pkgs; [
      xdg_utils
    ];
  };

  # Custom dir
  xdg = {
    enable = true;

    userDirs = {
      enable = true;

      download = "\$HOME/dl";
      desktop = "\$HOME";
      documents = "\$HOME/docs";
      music = "\$HOME";
      pictures = "\$HOME/pics";
      templates = "\$HOME";
      videos = "\$HOME/vids";
    };
  };
}
