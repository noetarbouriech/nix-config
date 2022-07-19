{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix          # LSP support for nix
      redhat.java           # LSP support for java
      golang.go             # LSP support for go
      redhat.vscode-yaml    # LSP support for yaml
      ms-python.python      # LSP support for python

      vscodevim.vim         # vim in vscode
      eamodio.gitlens       # git but better
    ];
  };
}
