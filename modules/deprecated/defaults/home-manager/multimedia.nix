{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol mpv youtube-dl vlc
  ];

  services.blueman-applet.enable = true;
}
