{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chromium firefox

    thunderbird

    libreoffice
    ghostwriter

    hunspell hunspellDicts.de-de hunspellDicts.en-us
  ];
}
