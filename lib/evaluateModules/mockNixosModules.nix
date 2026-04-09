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
  toplevelAttributes = [ "boot" "console" "environment" "hardware" "nix" "networking" "services" "time" ];
in
{
  options = builtins.listToAttrs (map (k: { name = k; value = mockOption; }) toplevelAttributes);
}
