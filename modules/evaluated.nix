{ pkgs, pretty ? false, ... }:

let
  modules = import ./.;
  evaluateModules = import ../lib/evaluateModules { inherit pkgs pretty; };
in
{
  ## Merge the modules nested in the attrset `profiles`
  profiles = builtins.mapAttrs (profileName: module: evaluateModules [module]) modules.profiles;
}
