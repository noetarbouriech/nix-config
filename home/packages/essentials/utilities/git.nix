{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Noé Tarbouriech";
    userEmail = "noe.tarbouriech@posteo.net";

    ignores = [
      "*.swp"
    ];

  };

  home.packages = with pkgs; [ git-crypt tig ];
}
