{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pass
    libreoffice ding
    simple-scan xsane gimp imagemagick ffmpeg
    thunderbird signal-desktop
    texlive.combined.scheme-full pdftk
  ];

  programs.chromium = {
    enable = true;
    extensions = [
      "naepdomgkenhinolocfifgehidddafch"  # browserpass

      "gcbommkclmclpchllfjekcdonpmejbdp"  # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"  # ublock origin
    ];
  };

  programs.browserpass.enable = true;
}
