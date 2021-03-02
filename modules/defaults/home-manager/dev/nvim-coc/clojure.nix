{ pkgs, ... }:
{
  home.packages = with pkgs; [ clojure-lsp ];
}
