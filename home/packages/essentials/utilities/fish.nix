{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      sudo = "doas";
      ll = "ls -l";
      lsa = "ls -a";
      ".." = "cd ..";

      v = "nvim";
      lv = "~/.local/bin/lvim";
      sv = "sudo nvim";

      py = "python3";

      nix-shell = "nix-shell --run fish";
      nixsh = "nix-shell -p";

      t = "tmux";
    };

    functions = {
      fish_greeting = "";
    };

    interactiveShellInit = "fish_vi_key_bindings";

  };

}
