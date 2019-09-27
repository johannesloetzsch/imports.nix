{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## we want the current version (at least 0.7.0)
    pkgs_unstable.profanity
  ];
}
