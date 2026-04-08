{
  description = "Opinionated NixOS modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  rec {
    nixosModules = import ./modules;

    ## A preevaluated version of nixosModules, it can be inspected by:
    ## > nix eval .#nixosModulesEvaluatedPretty --json | jq
    nixosModulesEvaluated = import ./modules/evaluated.nix { inherit pkgs; };
    nixosModulesEvaluatedPretty = import ./modules/evaluated.nix { inherit pkgs; pretty = true; };
  };
}
