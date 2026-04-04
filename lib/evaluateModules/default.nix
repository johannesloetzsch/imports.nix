{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,

  mockOptionsModule ? import ./mockNixosModules.nix,
  ...
}:

## This function evaluates (merges) the gives list of modules
modules:

(lib.evalModules {
  modules = modules ++ [ mockOptionsModule ];
}).config
