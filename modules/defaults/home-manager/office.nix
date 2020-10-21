{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice ding
  ];

  programs.chromium = {
    enable = true;
    extensions = [
      "gcbommkclmclpchllfjekcdonpmejbdp"  # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"  # ublock origin
    ];
  };
}
