{
  profiles = {

    ## fixes required for some hardware
    hardware_fixes = import ./profiles/hardware_fixes;

    ## systems running nixos
    nixos_essentials = import ./profiles/nixos_essentials;
    nixos_convenience = import ./profiles/nixos_convenience;

    ## systems used as client
    client_essentials = import ./profiles/client_essentials;

    ## tools for admins
    admin_essentials = import ./profiles/admin_essentials;
    admin_convenience = import ./profiles/admin_convenience;

  };
}
