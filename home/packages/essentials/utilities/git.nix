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
}
