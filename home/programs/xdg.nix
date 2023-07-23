{ config, pkgs, ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    mimeApps = {
      enable = true;
      defaultApplications = let
        pdf_reader = [ "zathura.desktop" ];
        browser = [ "chromium.desktop" ];
        video_player = [ "mpv.desktop" ];
        image_viewer = [ "imv.desktop" ];
      in {
        "application/pdf" = pdf_reader;
        "audio/*" = video_player;
        "video/*" = video_player;
        "image/*" = image_viewer;
      };

      associations.removed = let browser = [ "chromium.desktop" ];
      in { "application/pdf" = browser; };
    };
  };
}
