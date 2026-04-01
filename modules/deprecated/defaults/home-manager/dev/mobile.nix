{ pkgs, ... }:
{
  home.packages = with pkgs; [
    android-studio
    scrcpy
    fdroidserver jdk
  ];
}
