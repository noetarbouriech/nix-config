{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ansible 
    docker
    vagrant 
    /* google-cloud-sdk */
    /* kubectl */
    yarn
    insomnia
    # android-studio

    # uml
    staruml
    gofumpt
  ];
}
