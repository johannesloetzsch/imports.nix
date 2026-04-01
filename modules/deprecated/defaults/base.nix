## Some defaults I want for all my systems

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nix-index
    vim tmux
    wget curl
    htop atop iotop iftop
    file bc
    babashka rlwrap
  ];

  time.timeZone = "Europe/Berlin";
  environment.variables = { EDITOR = "vim"; };
}
