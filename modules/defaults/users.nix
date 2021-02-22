{ config, pkgs, ... }:
{
  users.users.j03 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "lp" "scanner"
                    "dialout"
                    "docker"
                    "adbusers"];
  };

  home-manager.users.j03 = { pkgs, config, ... }: {
    imports = [
      ./home-manager/base.nix
      ./home-manager/office.nix
      ./home-manager/multimedia.nix
      ./home-manager/admin.nix
      ./home-manager/dev/base.nix
      ./home-manager/dev/git.nix
      ./home-manager/dev/embedded.nix
      ./home-manager/dev/web.nix
      ./home-manager/dev/mobile.nix
      ./home-manager/dev/clojure.nix
      ./home-manager/dev/rust.nix
    ];
  };

  programs.adb.enable = true;
}
