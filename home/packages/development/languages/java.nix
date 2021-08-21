{ config, pkgs, ... }:

{
  environment.variables.JAVA_HOME = "${pkgs.jdk.home}/lib/openjdk";
  environment.systemPackages = [ pkgs.jdk ];
}
