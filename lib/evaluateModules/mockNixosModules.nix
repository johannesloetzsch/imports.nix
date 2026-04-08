{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,
  ...
}:

let
  mockOption = lib.mkOption {
   type = lib.types.anything;
   default = null;
  };
  toplevelAttributes = [ "boot" "environment" "nix" "networking" ];
in
{
  options = builtins.listToAttrs (map (k: { name = k; value = mockOption; }) toplevelAttributes);
}
