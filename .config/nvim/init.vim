" vim-plug
"PlugUpdate
"PlugUpgrade
" coc
"CocInstall
"coc-rust-analyzer
"coc-python
"coc-json
"coc-yaml
call plug#begin('~/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
call plug#end()

" various stuff
set expandtab
set softtabstop=4
set shiftwidth=4
syntax on
:set colorcolumn=100
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" nerdtree
nmap <F7> :NERDTreeToggle<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

" rust
let g:rustfmt_autosave = 1

