{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      coc-rust-analyzer
    ];

    extraConfig = ''
      let $RUST_SRC_PATH = '${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}'
    '';
  };

  #home.packages = with pkgs; [ rust-analyzer ];
}
