{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "git@johannesloetzsch.de";
    userName = "Johannes Lötzsch";
    ignores = [ "*.swp" ];
  };

  home.packages = with pkgs; [
    gitAndTools.gitflow
    circleci-cli
  ];
}
