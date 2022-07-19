{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ansible 
    docker
    vagrant 
    /* google-cloud-sdk */
    /* kubectl */
    yarn
    # android-studio

    # uml
    staruml
  ];
}
