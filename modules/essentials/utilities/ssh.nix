{ pkgs, ... }:

{
  programs.ssh = {
    extraConfig = ''
      TCPKeepAlive no
    '';
  };
}
