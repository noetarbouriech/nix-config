{ pkgs, ... }:


let
  unstableConf = { allowUnfree = true; };
  unstable = import <unstable> { config = unstableConf; };
in
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
    unstable.staruml
  ];

}

