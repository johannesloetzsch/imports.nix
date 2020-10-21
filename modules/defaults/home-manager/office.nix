{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice ding

    pavucontrol mpv youtube-dl
  ];

  programs.chromium = {
    enable = true;
    extensions = [
      "gcbommkclmclpchllfjekcdonpmejbdp"  # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"  # ublock origin
    ];
  };

  services.blueman-applet.enable = true;
}
