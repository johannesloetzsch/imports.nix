## Don't forget to use the module `home-manager.nixosModules.home-manager`

{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
