{ pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.mate.enable = true;
    displayManager.sddm.enable = true;
    #displayManager.slim.enable = true;  ## not longer maintained
    #displayManager.lightdm.enable = true;  ## problems when locking sceen at suspend?
    #displayManager.gdm.enable = true;  ## runs its own pulseaudio instance -> problem for blueman
  };

  ## setup gio - maybe this should be upstreamed to pkgs.mate
  services.gnome3.gvfs.enable = true;
  environment.variables.GIO_EXTRA_MODULES = [
    "${lib.getLib pkgs.gnome3.dconf}/lib/gio/modules"
    "${pkgs.gnome3.glib-networking.out}/lib/gio/modules"
    "${pkgs.gnome3.gvfs}/lib/gio/modules"
  ];

  environment.systemPackages = with pkgs; [ clipit ];
}
