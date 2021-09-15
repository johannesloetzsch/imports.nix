{ pkgs, ... }:
{
  home.packages = with pkgs; [
    leiningen
    python3  ## required by vim-fireplace

    clojure
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-fireplace ];
  };

  home.shellAliases = {
    portal = ''bb -cp `clj -Spath -Sdeps '{:deps {djblue/portal {:mvn/version "LATEST"}}}'` -m portal.main'';
  };
}
