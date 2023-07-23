{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ./fonts.nix ./services.nix ./nixconfig.nix ];

  boot = {
    tmp.useTmpfs = true;
    supportedFilesystems =
      [ "ntfs" ]; # For being able to mount windows drives ugh
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.aakash = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" "kvm" "docker" "video" ];
    };
  };

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [ git polkit_gnome ];
  };

  programs = {
    dconf.enable = true;
    zsh.enable = true;
    mtr.enable = true;
    light.enable = true;
    gnupg.agent.pinentryFlavor = "gnome3";
  };

  system = {
    stateVersion = "23.05";
    activationScripts.diff = {
      supportsDryActivation = true;
      text = ''
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };
  };
}
