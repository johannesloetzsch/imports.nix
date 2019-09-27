## Pulseaudio + Blueman

{ config, pkgs, lib, ... }:
{
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    #systemWide = true;
    zeroconf.discovery.enable = true;
    package = pkgs.pulseaudioFull;  ## Only the full build has Bluetooth support
  };

  hardware.bluetooth.enable = true;

  services.dbus.packages = [ pkgs.blueman ];
}
