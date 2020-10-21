## This function returns a module with configuration usefull if you want your git commits to be in sync with system.configurationRevision.
## It refuses to build from dirty trees.
## A git-hook rebuilds after every commit.

{ flake }:
(
  { pkgs, ... }:
  {
    system.configurationRevision = if flake ? rev
                                   then flake.rev
                                   else throw "Refusing to build from a dirty Git tree!";

    environment.etc."nixos/.git/hooks/post-commit" = {
      mode = "0500";
      text = ''
        #!/usr/bin/env sh
        nixos-rebuild switch
      '';
    };

    environment.systemPackages = with pkgs; [ git ];
  }
)
