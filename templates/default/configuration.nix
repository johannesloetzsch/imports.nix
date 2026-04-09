{ config, pkgs, lib, ... }:

{
  #services.xserver.xkb = { layout = "de"; variant = "neo"; };


  #time.timeZone = "Europe/Berlin";


  environment.systemPackages = with pkgs; [
  ];


  imports = [
  ];


  system.stateVersion = lib.mkDefault config.system.nixos.release;
}
