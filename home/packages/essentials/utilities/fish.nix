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
      sv = "sudo nvim";

      py = "python3";
    };

    # functions = {
    #   fish_user_key_bindings = {
    #     fish_vi_key_bindings
    #   };
    # };

  };

}
