{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    tmux
    htop
  ];

  environment.variables."EDITOR" = "vim";
}
