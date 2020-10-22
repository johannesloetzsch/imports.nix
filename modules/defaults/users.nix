{ config, pkgs, ... }:
{
  users.users.j03 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
  };

  home-manager.users.j03 = { pkgs, config, ... }: {
    imports = [
      ./home-manager/base.nix
      ./home-manager/office.nix
      ./home-manager/admin.nix
      ./home-manager/dev/git.nix
      ./home-manager/dev/web.nix
      ./home-manager/dev/embedded.nix
    ];
  };
}
