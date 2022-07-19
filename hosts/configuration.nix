{ config, pkgs, user, hostname, ... }:

{
  # Allow non-free software to be installed
  nixpkgs.config.allowUnfree = true;

  # Set the time zone
  time.timeZone = "Europe/Paris";
                                                                                                                                                                                              
  # Networking
  networking = {
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.                                                                                                            
    useDHCP = false;
    networkmanager.enable = true;
    hostName = "${hostname}";
  };

  # Enable X
  services.xserver = {
    enable = true;

    layout = "us"; # keymap configuration
    xkbOptions = "eurosign:e";
    xkbVariant = "intl";
  };

  # Enable sound.
  sound.enable = true;

  # Using doas instead of sudo
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      wheelNeedsPassword = true;
      extraRules = [
        { groups = [ "wheel" ]; noPass = false; keepEnv = true; persist = true; }
      ];
    };
  };

  # Enables the docker service
  virtualisation.docker.enable = true;

  # FR locale i18n
  i18n.extraLocaleSettings = {
    LC_MESSAGES = "en_US.UTF-8";
    LC_ADDRESS = "fr_FR.utf8";
    LC_IDENTIFICATION = "fr_FR.utf8";
    LC_MEASUREMENT = "fr_FR.utf8";
    LC_MONETARY = "fr_FR.utf8";
    LC_NAME = "fr_FR.utf8";
    LC_NUMERIC = "fr_FR.utf8";
    LC_PAPER = "fr_FR.utf8";
    LC_TELEPHONE = "fr_FR.utf8";
    LC_TIME = "fr_FR.utf8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" ];
    shell = pkgs.fish;
  };

  # Set nvim as the default editor
  environment.variables.EDITOR = "nvim";

  # Basic system-wide packages
  environment.systemPackages = with pkgs; [
    curl wget vim gnumake git pavucontrol font-manager python3 unzip
  ];

  # Fonts 
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ 
      "FiraCode"
      "FantasqueSansMono"
      "Mononoki"
    ];})
    noto-fonts
    twemoji-color-font
    oxygenfonts
    aileron
    route159
    libertine
  ];

  # Nix settings
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than-7d";
    };
    extraOptions = "experimental-features = nix-command flakes";
  };

  # This value must be kept at all costs, check man for more details
  system.stateVersion = "22.05"; 
}
