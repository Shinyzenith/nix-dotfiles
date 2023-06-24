{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      font-awesome
      iosevka-bin
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      nerdfonts
    ];
    fontconfig.defaultFonts = {
      monospace = [ "IosevkaTerm Nerd Font Mono" ];
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Noto Sans" "Source Han Sans" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

}
