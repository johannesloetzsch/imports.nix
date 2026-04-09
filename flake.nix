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

    templates = {
      default = {
        path = ./templates/default;
        description = "A minimal flake, providing full-featured nixosConfigurations with minimal effort.";
        welcomeText = ''
          ## Getting Started
          - run `nix flake new --template github:johannesloetzsch/imports.nix#default ./my-new-nixos`
          - run `nix run github:nix-community/disko/latest -- --mode destroy,format,mount --flake ./my-new-nixos#default`
          - run `nixos-install --flake ./my-new-nixos#default`
        '';
      };
    };
  };
}
