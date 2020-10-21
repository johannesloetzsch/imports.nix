{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    extensions = [
      "fmkadmapgofadopljbjfkapdkoienihi"  # react-developer-tools
      "lmhkpmbekcpmknklioeibfkpmmfibljd"  # redux-devtools
      "igbmhmnkobkjalekgiehijefpkdemocm"  # graphql-network
    ];
  };

  programs.firefox.enable = true;
}
