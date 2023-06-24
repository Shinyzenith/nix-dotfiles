{ config, pkgs, ... }:

{
  imports = [ ./gtk.nix ];

  home.file.".config" = {
    source = ./configs;
    recursive = true;
  };
}
