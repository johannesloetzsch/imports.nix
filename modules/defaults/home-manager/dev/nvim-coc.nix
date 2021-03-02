{ pkgs, ... }:
{
  imports = [
    ./nvim-coc/base.nix
    ./nvim-coc/spell-checker.nix
    ./nvim-coc/tsserver.nix

    ## https://github.com/neoclide/coc.nvim/wiki/Language-servers
    ## via ~/.config/nvim/coc-settings.json
    ./nvim-coc/nix.nix
    ./nvim-coc/clojure.nix
  ];
}
