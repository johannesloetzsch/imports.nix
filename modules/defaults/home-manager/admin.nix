{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bind.dnsutils
    traceroute nmap-graphical
    tcpdump mitmproxy
  ];
}
