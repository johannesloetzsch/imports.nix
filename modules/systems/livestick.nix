{ config, lib, pkgs, modulesPath, ... }:
{
  system.stateVersion = "23.11";

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/97e6606d-6f39-426d-bb37-e25aecb0c1fb";
      fsType = "ext2";
    };

  swapDevices = [ ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" "bcache" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/disk/by-id/usb-USB_SanDisk_3.2Gen1_010145c373f1f2c2b378f2e4450c5890025fc4a5def9e6fe720c9bddf9ef8cb3b0c600000000000000000000d8d57188ff825e00835581077528489f-0\:0";
  boot.loader.grub.forceInstall = true;

  boot.loader.grub.extraEntries = ''
    menuentry "LMDE 4 64-bit with Persistence" --class linuxmint {
      set root=(hd0,msdos2)
      set gfxpayload=keep
      linux   /live/vmlinuz boot=live persistence live-config live-media-path=/live quiet splash --
      initrd  /live/initrd.lz
    }
  '';

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}

