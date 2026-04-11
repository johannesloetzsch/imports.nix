{
  description = "Example deployment of NixOS installation using imports.nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    imports-nix = {
      url = "github:johannesloetzsch/imports.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, imports-nix }:
  let
    config = {
      nixpkgs.system = "x86_64-linux";
      networking.hostName = "nixos";
      networking.hostId = "00021805";
      disko.devices.disk.main.device = "/dev/disk/by-id/CHANGEME";
    };
  in
  {

    nixosConfigurations."${config.networking.hostName}" = nixpkgs.legacyPackages.${config.nixpkgs.system}.nixos [
      config ./configuration.nix
      disko.nixosModules.disko ./disko.nix
      imports-nix.nixosModules.profiles.hardware_fixes
      imports-nix.nixosModules.profiles.hardware_convenience
      imports-nix.nixosModules.profiles.nixos_essentials
      imports-nix.nixosModules.profiles.nixos_convenience
      imports-nix.nixosModules.profiles.nixos_opinionated
      imports-nix.nixosModules.profiles.client_essentials
      imports-nix.nixosModules.profiles.admin_essentials
      imports-nix.nixosModules.profiles.admin_convenience
      imports-nix.nixosModules.profiles.desktop_mate_essentials
      imports-nix.nixosModules.profiles.desktop_mate_fixes
      imports-nix.nixosModules.profiles.desktop_mate_convenience
    ];

    nixosConfigurations.default = self.nixosConfigurations."${config.networking.hostName}";
  };
}
