{ pkgs, ... }:
{
  imports = [
    ./node.nix
    ./clojure.nix
  ];

  home.packages = with pkgs; [
    docker-compose

    gnumake

    jre maven


    pkgs_unstable.dbeaver
    robo3t
  ];
}
