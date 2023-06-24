{ config, pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      use-xdg-base-directories = true;
      auto-optimise-store = true;

    };
    optimise.automatic = true;
  };
  nixpkgs.config.allowUnfree = true;
}
