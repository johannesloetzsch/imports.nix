{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,
  ...
}:

let
  mockOption = lib.mkOption { type=lib.types.anything; };
in
{
  ## Here we add all toplevel attributes that should be mocked
  options.nix = mockOption;
}
