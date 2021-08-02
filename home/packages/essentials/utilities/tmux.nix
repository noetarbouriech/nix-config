{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    clock24 = true;
    baseIndex = 1;
    historyLimit = 5000;
    keyMode = "vi";
    prefix = "C-a";
    tmuxinator.enable = true;

    plugins = with pkgs.tmuxPlugins; [
      nord
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }

    ];

  };
}
