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
    extraConfig = ''
      augroup SyntaxSettings
        autocmd!
        autocmd BufNewFile,BufRead *.tsx set filetype=typescript
      augroup END
    '';
  };

  home.packages = with pkgs; [
    nodejs_latest
    robo3t
    heroku
  ];
}
