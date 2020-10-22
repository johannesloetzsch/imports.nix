{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;

  users.groups.docker = {};

  virtualisation.docker.autoPrune.enable = true;
}
