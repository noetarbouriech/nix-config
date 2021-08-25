{ config, pkgs, lib, ... }:

{
  # Name of the device
  networking.hostName = "noe-laptop";

  # Boot as UEFI using systemd-boot bootloader
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
	      configurationLimit = 5;
      };
    };
  };

  # Hardware specific settings
  hardware = {
    acpilight.enable = true;
    trackpoint = {
      enable = true;
      device = "TPPS/2 Elan TrackPoint";
      speed = 127;
      sensitivity = 150;
    };
  };

  # Power related options
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  # Virtualisation using VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "noe" ];

  # Services
  services = {
    # X11
    xserver = {
      enable = true;

      # Touchpad settings
      libinput = {
        enable = true;
        touchpad = {
          tappingDragLock = false;
        };
      };

      # Option to prevent screen tearing
      deviceSection = ''
        Option "TearFree" "true" 
      '';

      # Window manager (bspwm)
      windowManager.bspwm.enable = true;

      # Display manager (lightdm)
      displayManager = {
        defaultSession = "none+bspwm";
        lightdm.enable = true;
      };

    };

    # Battery related services
    tlp.enable = true;
    acpid.enable = true;
    upower.enable = true;
  };

  # Essential packages for laptop
  environment.systemPackages = with pkgs; [
    acpi brightnessctl powertop 
  ];

}
