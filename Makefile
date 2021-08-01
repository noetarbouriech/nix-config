# helper makefile to setup and organize my NixOS config
default: update

ifneq (,$(wildcard ./.env))
    include .env
    export
endif


init: # Initial setup
		@echo "~ Initializing config"

		# Symlinking
		@echo "Symlinking files..."
		doas ln -s /home/noe/nix/configuration.nix /etc/nixos/configuration.nix
		ln -s /home/noe/nix/home/home.nix /home/noe/.config/nixpkgs/home.nix
		doas nixos-generate-config
ifeq ("${DEVICE}", "desktop") 
		ln -s /home/noe/nix/hosts/desktop/configuration.nix /home/noe/nix/current.nix
		cp /home/noe/nix/hosts/desktop/home.nix /home/noe/nix/home/current.nix
else 
		ln -s /home/noe/nix/hosts/thinkpad/configuration.nix /home/noe/nix/current.nix
		cp /home/noe/nix/hosts/thinkpad/home.nix /home/noe/nix/home/current.nix
endif

		# home-manager
		@echo "Installing home-manager..." 
		nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
		nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
		nix-channel --update
		nix-shell '<home-manager>' -A install
		# home-manager switch

update: # Updating 
		@echo "~ Updating..."
		home-manager switch
		doas nixos-rebuild switch
		@echo "Update done!"

push: # Push updates
		git add .
		@read -p "Enter commig message:" COMMITMSG
		git commit -m ${COMMITMSG}
		@echo "~ Pushing"
		@echo "git pushing updates"
		git push
		@echo "Done !"

clear: # Clear existent config
		@echo "~ Clearing config..."
		doas rm -f /etc/nixos/*
		rm -f /home/noe/nix/current.nix
		rm -f /home/noe/nix/home/current.nix
		rm -f /home/noe/.config/nixpkgs/*
		@echo "Done !"
