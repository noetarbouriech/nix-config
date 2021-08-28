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

        sessionCommands = ''
          light-locker --lock-on-suspend --lock-on-lid --lock-after-screensaver=0 &
        '';

        lightdm = {
          enable = true;
          background = /home/noe/pics/wall-blurred.png;
          greeters.mini = {
            enable = true;
            user = "noe";
            extraConfig = ''
              [greeter-theme]
              font = "FantasqueSansMono Nerd Font"
              text-color = "#F8F8F0"
              window-color = "#29684b"
              border-width = 3px
              border-color = "#F8F8F0"
              password-background-color = "#29684b"
              password-border-color = "#F8F8F0"
              password-border-width = 1px
            '';
          };
        };

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
