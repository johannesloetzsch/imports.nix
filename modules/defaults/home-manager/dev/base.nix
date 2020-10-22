{ pkgs, ... }:
{
  home.packages = with pkgs; [
    docker-compose
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
      set mouse=a
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      { plugin = coc-nvim;
        config = ''
          " Use <cr> and <tab> to confirm completion. If none was selected, select the first completion.
          inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<cr>"
          inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"
          " GoTo code navigation. Jumping back is CTRL+O
          nmap <silent> gd <Plug>(coc-definition)
          nmap <silent> gy <Plug>(coc-type-definition)
          nmap <silent> gi <Plug>(coc-implementation)
          nmap <silent> gr <Plug>(coc-references)
          " When holding the cursor: Highlight the symbol and its references and show the documentation
          autocmd CursorHold * silent call CocActionAsync('highlight')
          autocmd CursorHold * silent call CocActionAsync('doHover')
          nmap <silent> gh :call CocActionAsync('doHover')<cr>
        '';
      }
    ];
  };
}
