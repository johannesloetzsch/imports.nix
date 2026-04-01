{
  description = "Opinionated NixOS modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  {
    nixosModules = import ./modules;
  };
}
