{
  description = "J03s NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    base-modules = [
      ./modules/defaults/nix.nix
      (import ./lib/gitflakes.nix {flake=self;})
  
      home-manager.nixosModules.home-manager
      ./modules/defaults/home-manager.nix
  
      ./modules/defaults/base.nix
    ];
  in
  {
    legacyPackages.x86_64-linux = {
      inherit pkgs;
    };

    nixosConfigurations = {
  
      t470s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = base-modules ++ [
          nixos-hardware.nixosModules.lenovo-thinkpad-t470s
          ./modules/systems/t470s.nix
          ./modules/defaults/networking.nix
          ./modules/defaults/desktop.nix
          ./modules/defaults/users.nix
          ./modules/defaults/virtualization/docker.nix
          ({ pkgs, ... }: {
            nix.nixPath = [ "nixpkgs=${nixpkgs}" ];  ## get rid of channels
          })
        ];
      };
  
      livestick = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = base-modules ++ [
          ./modules/systems/livestick.nix
          ./modules/defaults/networking.nix
          ./modules/defaults/desktop.nix
          ./modules/defaults/users.nix
        ];
      };
  
    };
  };
}
