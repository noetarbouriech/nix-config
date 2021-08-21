{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    clock24 = true;
    baseIndex = 1;
    historyLimit = 5000;
    keyMode = "vi";
    prefix = "C-a";

    plugins = with pkgs.tmuxPlugins; [
      nord
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-processes 'ssh'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '30' # minutes
        '';
      }

    ];

  };
}
