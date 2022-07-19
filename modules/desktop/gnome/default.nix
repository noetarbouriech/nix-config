{ home-manager, user, config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Audio settings
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Home-manager settings
  home-manager.users.${user} = {
    gtk = {
      enable = true;
      theme = {
        package = pkgs.vimix-gtk-themes;
        name = "vimix-laptop-doder";
      };
      iconTheme = {
        package = pkgs.tela-icon-theme;
        name = "Tela";
      };
    };

    home.packages = with pkgs; [];
  };
}
