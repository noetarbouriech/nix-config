{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Noé Tarbouriech";
    userEmail = "noe.tarbouriech@posteo.net";

    ignores = [
      "*.swp"
    ];

    extraConfig = { 
      pull.rebase = true;
      rebase.autoStash = true;
      submodule.recurse = true;
    };

  };

  programs.lazygit = {
    enable = true;
  };

  home.packages = with pkgs; [ git-crypt tig gh ];
}
