{ ... }:
{
  nixpkgs.overlays = [
    (self: super:
      {
        pkgs_unstable = import "${fetchTarball http://nixos.org/channels/nixos-unstable/nixexprs.tar.xz}" {};
        pkgs_git = import nixpkgs/default.nix {};
      }
    )
  ];
}
