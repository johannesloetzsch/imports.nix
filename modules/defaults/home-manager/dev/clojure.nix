{ pkgs, ... }:
{
  home.packages = with pkgs; [
    leiningen
    python3  ## required by vim-fireplace
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-fireplace ];
  };
}
