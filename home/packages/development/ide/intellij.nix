{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      jetbrains.idea-ultimate     # Intellij idea
    ];

    sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

  };

}
