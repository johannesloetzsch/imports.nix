{ pkgs, ... }:
{
  imports = [
    ./nvim-coc/base.nix
    ./nvim-coc/tsserver.nix
    ./nvim-coc/spell-checker.nix
  ];
}
