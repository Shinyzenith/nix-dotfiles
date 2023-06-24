{ config, pkgs, ... }:

{
  imports = [ ./programs.nix ./xdg.nix ./browsers.nix ./shell.nix ];
}
