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

  services.printing = {
    enable = true;
    drivers = with pkgs; [ gutenprint hplip splix ];
  };

  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [ hplipWithPlugin ];
  };

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    zeroconf.discovery.enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
}
