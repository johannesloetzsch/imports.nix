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

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      coc-nvim
      coc-tsserver
    ];
  };

  home.packages = with pkgs; [
    nodejs_latest
    robo3t
    heroku
  ];
}
