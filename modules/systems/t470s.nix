{ config, lib, pkgs, modulesPath, ... }:
{
  system.stateVersion = "23.11";
  networking.hostName = "t470s";

  imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      #../defaults/tmp/mongodb.nix
      #../defaults/tmp/kibana.nix
      #../defaults/tmp/neo4j.nix
      ../defaults/fonts.nix
    ];

  boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/disk/by-id/nvme-eui.0000000001000000e4d25c1042e25101-part1"; # or "nodev" for efi only
  boot.loader.grub.forceInstall = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  #boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."crypt-root".device = "/dev/disk/by-uuid/20b52fdc-a137-4b56-ba80-cead63530624";
  boot.initrd.luks.devices."crypt-swap".device = "/dev/disk/by-uuid/9f8252b3-6114-4033-a9e4-d8037586b25d";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7C94-4BA2";
      fsType = "vfat";
    };
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/14b524b1-8136-4ced-b515-a26dbe20ff5e";
      fsType = "ext4";
    };
  swapDevices =
    [ { device = "/dev/disk/by-uuid/fd88947a-5d73-43a0-9ddf-494effbaf313"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  services.thinkfan.enable = true;
  boot.extraModprobeConfig = ''
    options thinkpad_acpi fan_control=1
  '';

  nixpkgs.config.allowUnfree = true;  ## required by android-studio
  boot.supportedFilesystems = [ "ntfs" ];

  ## required for pergola
  networking.extraHosts = "127.0.0.3 keycloak";
}
