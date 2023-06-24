{ config, pkgs, ... }:

{
  imports = [ ./programs ./config ];

  home = {
    username = "aakash";
    homeDirectory = "/home/aakash";
    keyboard = {
      layout = "us";
      options = [ "caps:swapescape" ];
    };

    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
}
