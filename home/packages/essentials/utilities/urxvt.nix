{ config, pkgs, ... }:

{
  programs.urxvt = {
    enable = true;
    fonts = [ "xft:FantasqueSansMono Nerd Font:size=12" ];
    iso14755 = false;
    extraConfig = {
      internalBorder = 12;
      lineSpace = 0;
      letterSpace = 0;
      geometry = "92x24";
    };
  };

  xresources.extraConfig = builtins.readFile (
    pkgs.fetchFromGitHub {
        owner = "arcticicestudio";
        repo = "nord-xresources";
        rev = "9444bda41d3c519f2cc6f505b8e6a30d98325759";
	sha256 = "1b775ilsxxkrvh4z8f978f26sdrih7g8w2pb86zfww8pnaaz403m";
    } + "/src/nord"
  );
  xresources.properties = {
    "XTerm.vt100.faceName" = "FantasqueSansMono Nerd Font:size=8";
  };

}

