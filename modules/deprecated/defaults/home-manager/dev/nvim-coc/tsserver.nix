{ pkgs, ... }:
{
  programs.neovim = {
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      coc-css
      coc-json

      { plugin = coc-tsserver;
        config = ''
          "let g:coc_filetype_map = { "tsx": "typescript.tsx" }

          augroup SyntaxSettings
            autocmd!
            autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
          augroup END
        '';
      }
    ];
  };
}
