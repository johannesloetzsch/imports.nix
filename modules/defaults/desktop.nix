{ config, pkgs, ... }:

{
  console.useXkbConfig = true;
  services.xserver.enable = true;
  services.xserver.layout = "de";
  services.xserver.xkbVariant = "neo";

  services.xserver.libinput.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.mate.enable = true;

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
}
