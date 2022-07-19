{ config, pkgs, lib, user, ... }:

{
  # Boot as UEFI using systemd-boot bootloader
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
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
  users.extraGroups.vboxusers.members = [ "${user}" ];

  services = {
    # TailScale
    tailscale.enable = true;

    # Battery related services
    acpid.enable = true;
    upower.enable = true;
  };

  # Essential packages for laptop
  environment.systemPackages = with pkgs; [
    acpi brightnessctl powertop 
  ];
}
