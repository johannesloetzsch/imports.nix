{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol mpv youtube-dl
  ];

  services.blueman-applet.enable = true;
}
