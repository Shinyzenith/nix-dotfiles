{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc-2.0";
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    theme = {
      package = pkgs.tokyo-night-gtk;
      name = "Tokyonight-Dark-B";
    };
  };
}
