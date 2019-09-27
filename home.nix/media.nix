{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    mpv
    vlc x264
    pkgs_unstable.youtube-dl phantomjs2
  ];
}
