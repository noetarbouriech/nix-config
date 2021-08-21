{ config, pkgs, ... }:

{
  imports = [ 
    /etc/nixos/hardware-configuration.nix # Results of the hardware scan. Must be kept
    ./current.nix # Config specific to the current device
  ];

  # Allow non-free software to be installed
  nixpkgs.config.allowUnfree = true;

  # Set the time zone
  time.timeZone = "Europe/Paris";
                                                                                                                                                                                              
  # Networking
  networking = {
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.                                                                                                            
    useDHCP = false;
    networkmanager.enable = true;
  };

  # Enable X
  services.xserver = {
    enable = true;

    layout = "us"; # keymap configuration
    xkbOptions = "eurosign:e";
    xkbVariant = "intl";
  };

  services.redshift.enable = true;
  location.latitude = 46.8566419; # coords Paris
  location.longitude = 2.3518481;

  services.gnome.gnome-keyring.enable = true; # mailspring

  services.dbus = {
    enable = true;
    packages = [ pkgs.gnome3.dconf ]; # to avoid ca.desrt.dconf error
  };
  programs.dconf.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

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


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.noe = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" ];
    shell = pkgs.fish;
  };

  # Set nvim as the default editor
  environment.variables.EDITOR = "nvim";

  # Basic system-wide packages
  environment.systemPackages = with pkgs; [
    curl wget vim gnumake git tela-icon-theme pavucontrol font-manager python3
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

  # This value must be kept at all costs for some reason... check man for more details
  system.stateVersion = "21.05"; 

}
