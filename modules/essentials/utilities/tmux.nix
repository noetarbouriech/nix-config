{ config, pkgs, ... }:

let
  tt = pkgs.writeShellScriptBin "tt" ''
    tmux a -t $(tmux ls -F "#{session_name}" | fzf)    
  '';
in
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    historyLimit = 5000;
    keyMode = "vi";
    prefix = "C-a";
    terminal = "screen-256color";
    escapeTime = 0;
    extraConfig = ''
      set-option -g default-terminal "screen-256color"
      set-option -g terminal-overrides "screen-256color"
      set-option -g mouse on
    '';

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
  
  home.packages = with pkgs; [ tt ];
}
