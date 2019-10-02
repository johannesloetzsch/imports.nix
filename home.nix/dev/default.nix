{ pkgs, ... }:
{
  imports = [
    ./node.nix
    ./clojure.nix
  ];

  home.packages = with pkgs; [
    docker-compose

    gnumake

    jre
  ];
}
