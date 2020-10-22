## Some defaults I want for all my systems

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim tmux
    wget curl
    file
    htop atop iotop iftop
    nix-index
  ];

  time.timeZone = "Europe/Berlin";
  environment.variables = { EDITOR = "vim"; };
}
