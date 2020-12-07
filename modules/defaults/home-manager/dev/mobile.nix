{ pkgs, ... }:
{
  home.packages = with pkgs; [
    android-studio
    scrcpy  ## contains adb
    fdroidserver jdk
  ];
}
