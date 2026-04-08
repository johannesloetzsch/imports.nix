{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,

  pretty ? false,
  mockOptionsModule ? import ./mockNixosModules.nix,
  mockPkgs ? if pretty then (lib.mapAttrs (k: v: k) pkgs) else pkgs,
  ...
}:

## This function evaluates (merges) the gives list of modules
modules:

(lib.evalModules {
  modules = modules ++ [
    mockOptionsModule
    { 
      config._module.args = {
        pkgs = mockPkgs;
      };
    }
  ];
}).config
