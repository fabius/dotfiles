" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'junegunn/fzf.vim'
    Plug 'leafOfTree/vim-svelte-plugin'
    Plug 'liuchengxu/vista.vim'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'rust-lang/rust.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-syntastic/syntastic'
call plug#end()

" coc extensions
let g:coc_global_extensions = [
    \"coc-css",
    \"coc-cssmodules",
    \"coc-explorer",
    \"coc-git",
    \"coc-go",
    \"coc-html",
    \"coc-json",
    \"coc-markdownlint",
    \"coc-prettier",
    \"coc-python",
    \"coc-rust-analyzer",
    \"coc-snippets",
    \"coc-sourcekit",
    \"coc-sql",
    \"coc-svelte",
    \"coc-tabnine",
    \"coc-texlab",
    \"coc-tsserver",
    \"coc-vetur",
    \"coc-xml",
    \"coc-yaml",
\]
    " \"coc-graphql",

" display line numbering
set number
highlight LineNr ctermfg=grey

" tab -> spaces
set expandtab
set softtabstop=4
set shiftwidth=4

" highlight column #100
set colorcolumn=100
highlight ColorColumn ctermbg=8

" highlight leading & trailing whitespaces
set list
set listchars

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tab through completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc-explorer
nmap <F7> :CocCommand explorer<CR>

" fzf
set rtp+=/usr/local/opt/fzf
nmap <F5> :History<CR>
nmap <F6> :Files<CR>

" vista
nmap <F8> :Vista!!<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'coc'

" display
syntax on
colorscheme gruvbox
set encoding=utf-8

" python
let g:python3_host_prog = "/usr/local/bin/python3"
