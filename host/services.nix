{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  sound.enable = true;

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
    };
    enableRedistributableFirmware = true;
    uinput.enable = true;
    enableAllFirmware = true;
    bluetooth.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  services = {
		flatpak.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    dbus.enable = true;
    openssh.enable = true;
    xserver.xkbOptions = "caps:swapescape";
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
