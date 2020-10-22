{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fdroidserver
    scrcpy  ## contains adb
    android-studio
  ];
}
