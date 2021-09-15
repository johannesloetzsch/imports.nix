{ config, pkgs, nixpkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerdfonts  ## required for starship
  ];
}
