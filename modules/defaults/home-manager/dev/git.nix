{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "git@johannesloetzsch.de";
    userName = "Johannes Lötzsch";
    ignores = [ "*.swp" ];
    extraConfig = { pull.rebase = true; };
  };

  home.packages = with pkgs; [
    gitAndTools.gitflow
    circleci-cli
  ];
}
