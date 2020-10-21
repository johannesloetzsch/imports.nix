## Some defaults I want for all my systems

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim tmux
    htop atop iotop iftop
    wget curl
  ];

  time.timeZone = "Europe/Berlin";
  environment.variables = { EDITOR = "vim"; };
}
