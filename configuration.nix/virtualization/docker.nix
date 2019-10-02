{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;

  users.groups.docker = {};

  ## Remember to add your $USER to the `docker` group
  #users.extraUsers.USER.extraGroups = ["docker"];

  virtualisation.docker.autoPrune.enable = true;
}

## You may want install docker-compose with home-manager
