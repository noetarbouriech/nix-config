{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    iconTheme = {

      name = "tela-icons";
      package = pkgs.tela-icon-theme;
    };
  };
}
