{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pass
    libreoffice ding
    gimp imagemagick
    thunderbird signal-desktop
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
