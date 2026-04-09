{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.mate.enable = true;
  
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
