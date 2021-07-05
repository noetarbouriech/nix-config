{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    ignores = [
      "*.swp"
    ];

    signing = {
      key = null;
      signByDefault = true;
    };

  };
}
