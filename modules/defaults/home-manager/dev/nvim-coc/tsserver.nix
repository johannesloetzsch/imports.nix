{ pkgs, ... }:
{
  programs.neovim = {
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      coc-tsserver
      coc-css
    ];
  };
}
