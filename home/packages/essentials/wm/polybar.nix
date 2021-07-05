{ config, pkgs, ... }:

{
  services.polybar = {
    enable = true;

    script = "polybar main &";

    package = pkgs.polybar.override {
      pulseSupport = true;
      iwSupport = true;
      githubSupport = true;
    };

    config = {

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };

      "bar/main" = {
        monitor = "\${env:MONITOR:eDP}";
        width = "100%";
        height = "3%";
        background = "#0000"; 
        foreground = "#ffff";
        font-0 = "FantasqueSansMono Nerd Font:pixelsize=13;4";
        wm-restack = "bspwm";
        modules-left = "bspwm";
        modules-center = "date";
        modules-right = "newsboat temperature pulseaudio battery";
        padding-left = 1;
        padding-right = 0;
        module-margin = 1;
        enable-ipc = true;
        fixed-center = true;
	tray-position = "right";
      };

      "module/bspwm" = {
        type = "internal/bspwm";
        format = "<label-state>";
        format-padding = 0;
        index-sort = true;
        
        enable-click = true;
        reverse-scroll = false;
        
        label-focused = "";
        label-focused-padding = 1;
        label-occupied = "";
        label-occupied-padding = 1;
        label-empty = "";
        label-empty-padding = 1;
      };

      "module/temperature" = {
	type = "internal/temperature";
        interval = 3;
	thermal-zone = 0;
	base-temperature = 30;
	warn-temperature = 80;
	label-warn-foreground = "#f00";
	format = "<ramp> <label>";
        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
        ramp-5 = "";
      };

      "module/date" = {
        type = "internal/date";
	date = "%H:%M";
	date-alt = "%A, %B %d, %Y";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
	interval = 2;
        format-volume = "<ramp-volume> <label-volume>";
        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = "";
        label-muted = "  muted";
        click-right = "${pkgs.pavucontrol}/bin/pavucontrol &";
      };

      "module/battery" = {
        type = "internal/battery";
	battery = "BAT0";
	adapter = "AC";

	format-charging = "<animation-charging> <label-charging>";
	format-discharging = "<ramp-capacity> <label-discharging>";

	ramp-capacity-0 = "";
	ramp-capacity-1 = "";
	ramp-capacity-2 = "";
	ramp-capacity-3 = "";
	ramp-capacity-4 = "";

	animation-charging-0 = "";
	animation-charging-1 = "";
	animation-charging-2 = "";
	animation-charging-3 = "";
	animation-charging-4 = "";
	animation-charging-framerate = 750;
      };


    };

  };

}
