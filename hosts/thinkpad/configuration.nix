{ config, pkgs, lib, ... }:

{
  # Name of the device
  networking.hostName = "noe-laptop";

  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
	      configurationLimit = 5;
      };
    };
  };

  # hardware specific settings
  hardware = {
    acpilight.enable = true;
    trackpoint = {
      enable = true;
      device = "TPPS/2 Elan TrackPoint";
      speed = 127;
      sensitivity = 150;
    };
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "noe" ];

  services = {
    xserver = {
      enable = true;

      # touchpad settings
      libinput = {
        enable = true;
        touchpad = {
          tappingDragLock = false;
        };
      };

      deviceSection = ''
        Option "TearFree" "true" 
      '';

      # window manager (bspwm)
      windowManager.bspwm.enable = true;

      # lightdm
      displayManager = {
        defaultSession = "none+bspwm";
        lightdm.enable = true;
      };

    };

    # battery related services
    tlp.enable = true;
    acpid.enable = true;
    upower.enable = true;
  };

  environment.systemPackages = with pkgs; [
    acpi brightnessctl powertop 
  ];

}
