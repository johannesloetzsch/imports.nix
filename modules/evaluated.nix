{ pkgs, ... }:

let
  modules = import ./.;
  evaluateModules = import ../lib/evaluateModules { inherit pkgs; };
in
{
  ## Merge the modules nested in the attrset `profiles`
  profiles = builtins.mapAttrs (profileName: module: evaluateModules [module]) modules.profiles;
}
