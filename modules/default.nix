{
  profiles = {

    ## fixes required for some hardware
    hardware_fixes = import ./profiles/hardware_fixes;
    ## all available kernel modules, firmware and fixes
    hardware_convenience = import ./profiles/hardware_convenience;

    ## systems running nixos
    nixos_essentials = import ./profiles/nixos_essentials;
    nixos_convenience = import ./profiles/nixos_convenience;
    nixos_opinionated = import ./profiles/nixos_opinionated;

    ## systems used as client
    client_essentials = import ./profiles/client_essentials;

    ## tools for admins
    admin_essentials = import ./profiles/admin_essentials;
    admin_convenience = import ./profiles/admin_convenience;

    ## desktop environments
    desktop_mate_essentials = import ./profiles/desktop_mate_essentials;
    desktop_mate_fixes = import ./profiles/desktop_mate_fixes;
    desktop_mate_convenience = import ./profiles/desktop_mate_convenience;
  };
}
