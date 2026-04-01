{ config, pkgs, ... }:
{
  services.elasticsearch = {
    enable = true;
    package = pkgs.elasticsearch7;
  };
  services.kibana.enable = true;
}
