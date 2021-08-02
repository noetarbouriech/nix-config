{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      character = {
        success_symbol = "[\\$](bold green)";
        error_symbol = "[\\$](bold red)";
        vicmd_symbol = "[](bold green)";
      };
      add_newline = true;
      package.disabled = true;
      nix_shell.disabled = false;

      directory.read_only = " ";
      docker_context.symbol = " ";
      git_branch.symbol = " ";
      golang.symbol = " ";
      java.symbol = " ";
      nix_shell.symbol = " ";
      package.symbol = " ";
      php.symbol = " ";
      python.symbol = " ";
      rust.symbol = " ";
      shlvl.symbol = " ";

    };

  };

}
