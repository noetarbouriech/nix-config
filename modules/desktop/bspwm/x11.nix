{ config, pkgs, ... }:

{
  services.xserver = {
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
}
