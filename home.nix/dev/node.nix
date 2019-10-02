{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs_git.nodejs_latest
  ];

  programs.bash = {
    enable = true;
    initExtra = ''
      PATH="$PATH:./node_modules/.bin"
    '';
  };
}
