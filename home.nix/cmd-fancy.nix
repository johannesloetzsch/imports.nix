## Overwrites some basic commandline utils with fancy versions:
## ls, cat, grep, less
## The original programs are available with the suffix "_"

{ pkgs, ... }:
{
  home.packages = with pkgs; [ exa bat ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ls_ = ''$(which ls)'';
      ls = ''exa'';
      cat_ = ''$(which cat)'';
      cat = ''bat'';
      grep_ = ''$(which grep)'';
      grep = ''grep --color'';
      less_ = ''$(which less)'';
    };
    initExtra = ''
      function less () {
        bat $@ --color always | less_ -r
      }
    '';
  };
}
