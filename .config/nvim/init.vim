" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'rust-lang/rust.vim'
    Plug 'neoclide/coc.nvim'
        "coc-rust-analyzer
        "coc-python
        "coc-json
        "coc-yaml
    Plug 'preservim/tagbar'
    Plug 'vim-syntastic/syntastic'
call plug#end()

" display line numbering
set number
highlight LineNr ctermfg=grey

" tab -> spaces
set expandtab
set softtabstop=4
set shiftwidth=4

" highlight column #100
set colorcolumn=100
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" highlight leading & trailing whitespaces
set list
set listchars

" nerdtree
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" tagbar
nmap <F8> :TagbarToggle<CR>

" rust
let g:rustfmt_autosave = 1
syntax on
