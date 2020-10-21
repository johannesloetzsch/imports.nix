{ config, pkgs, ... }:

{
  console.useXkbConfig = true;
  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "neo";

    libinput.enable = true;

    displayManager.lightdm.enable = true;
    desktopManager.mate.enable = true;
  };

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    zeroconf.discovery.enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.bluetooth.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
}
