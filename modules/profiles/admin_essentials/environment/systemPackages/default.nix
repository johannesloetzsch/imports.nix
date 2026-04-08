{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    tmux
    htop
  ];
}
