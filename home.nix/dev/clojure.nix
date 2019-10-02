{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clojure
    leiningen

    python  ## required by vim-fireplace
  ];

  programs.vim = {
    enable = true;
    plugins = [ "vim-fireplace" ];
    extraConfig = ''
      "au BufRead,BufNewFile *.cljs Piggieback (shadow.cljs.devtools.api/nrepl-select :app)
    '';
  };
}
