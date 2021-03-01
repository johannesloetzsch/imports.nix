{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bind.dnsutils fping
    traceroute nmap-graphical
    tcpdump mitmproxy
  ];
}
