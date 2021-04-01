{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bind.dnsutils fping speedtest-cli
    traceroute nmap-graphical
    tcpdump mitmproxy
  ];
}
