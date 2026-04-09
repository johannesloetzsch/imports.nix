{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    atop btop iftop iotop
    dig
    jq
  ];
}
