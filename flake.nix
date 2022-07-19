{
  description = "Personal NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, ... }:
    let 
      user = "noe";

      # credits to sioodmy's config
      # https://github.com/sioodmy/dotfiles/blob/722966ad0b03807bc1e661174c4be6bc876f1ed0/flake.nix
      mkSystem = pkgs: system: hostname: desktop:
        pkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit user hostname inputs; };
          modules = [
            ./hosts/configuration.nix # default config
            ./hosts/${hostname}/configuration.nix # host specific config
            ./hosts/${hostname}/hardware-configuration.nix # generated hardware config
            ./modules/desktop/${desktop} # DE / WM for the given system

            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit user hostname; };
                users.${user} = ./hosts/${hostname}/home.nix;
              };
              nixpkgs.overlays = [
                nur.overlay
              ];
            }
          ];
        };
    in {
      nixosConfigurations = {
        desktop = mkSystem inputs.nixpkgs "x86_64-linux" "desktop" "gnome";
        thinkpad = mkSystem inputs.nixpkgs "x86_64-linux" "thinkpad" "gnome";
      };
    };
}
