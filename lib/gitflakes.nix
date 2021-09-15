## This function returns a module with configuration usefull if you want your git commits to be in sync with system.configurationRevision.
## It refuses to build from dirty trees.
## A git-hook rebuilds after every commit.

{ flake }:
(
  { pkgs, ... }:
  {
#    system.configurationRevision = if flake ? rev
#                                   then flake.rev
#                                   else throw "Refusing to build from a dirty Git tree!";

    environment.etc."nixos/.git/hooks/post-commit" = {
      mode = "0550"; group = "wheel";
      text = ''
        #!/usr/bin/env sh
        BRANCH="$(git rev-parse --abbrev-ref HEAD)"
        sudo nixos-rebuild switch --profile-name $BRANCH
      '';
    };

    environment.systemPackages = with pkgs; [ git ];
  }
)
