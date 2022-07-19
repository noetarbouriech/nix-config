{ pkgs, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        font = "FantasqueSansMono 14";
        geometry = "600x3-10+60";
        format = "<b>%a</b>\n<i>%s</i>\n%p %n\n%b";
        shrink = true;
        notification_height = 0;
        ignore_newline = false;
        word_wrap = true;
        allow_markup = true;
        show_age_treshold = 60;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        frame_width = 3;
        color = "#ffffff";
        separator_color = "#565d6d";
        frame-color = "#2e3440";

        icon_position = "left";
      };

      iconTheme = {
        package = "${pkgs.tela-icon-theme}";
        name = "Tela";
        size = "32x32";
      };

      urgency_normal = {
        background = "#37474f";
        foreground = "#eceff1";
        timeout = 10;
      };
    };
  };
}
