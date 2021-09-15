{ config, pkgs, nixpkgs, ... }:

{
  boot.tmp.cleanOnBoot = true;

  nix.package = pkgs.nixUnstable;
  #nix.extraOptions = "experimental-features = nix-command flakes ca-derivations";
  nix.extraOptions = "experimental-features = nix-command flakes";

  #nix.daemonIONiceLevel = 7;
  #nix.daemonNiceLevel = 19;

  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  #nix.binaryCaches = [ "https://binarycache.servers.timmitransport.de/" ];
  #nix.binaryCaches = [ "https://binarycache.timmi.johannesloetzsch.de/" ];
  #nix.binaryCachePublicKeys = [ "binarycache.timmi.johannesloetzsch.de:YzP+MuSRG40O7H3EqFyq4+C7w9aKJXOWX1fkhmVCy/0=" ];
}
