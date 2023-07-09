{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  sound.enable = true;

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
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

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
      };
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
