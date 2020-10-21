{ pkgs, ... }:
{
  home.packages = with pkgs; [
    traceroute nmap-graphical
     tcpdump mitmproxy
  ];
}
