{ pkgs, ... }:

{
  programs.go = {
    enable = true;

    goPath = "code/go";

    packages = {
      "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
      "golang.org/x/time" = builtins.fetchGit "https://go.googlesource.com/time";
      "golang.org/x/net" = builtins.fetchGit "https://go.googlesource.com/net";
    };
  };

}
