{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnumake
    docker-compose

    openssl
  ];
}
